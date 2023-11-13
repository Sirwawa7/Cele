import 'package:bustick/data/bus.dart';
import 'package:bustick/data/slot.dart';
import 'package:bustick/screens/payment_screen.dart';
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/back_widget.dart';
import 'package:bustick/widgets/bus_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SeatPlanScreen extends StatefulWidget {
  final Bus bus;

  SeatPlanScreen({required this.bus});

  @override
  _SeatPlanScreenState createState() => _SeatPlanScreenState();
}

class _SeatPlanScreenState extends State<SeatPlanScreen> {
  List list = [];
  List li = [];
  int index = 0;
  double discount = 0.0;
  double totalPrice = 0.0;
  double totalPayable = 0.0;

  List<dynamic> pickupPointList = [
    'Mbabane Bus Rank (8:30)',
    'Manzini Bus Stop (10:30)',
    'N'
        'ew Matsapha Mahhala (07:15)'
  ];
  String selectedPickupPoint = 'Select Type';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedPickupPoint = pickupPointList[0].toString();

    getSlotList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: Stack(
          children: [
            BackWidget(
              title: Strings.seatPlan,
            ),
            bodyWidget(context),
            buttonWidget(context)
          ],
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
        bottom: 70,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _ticketWidget(context),
            SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            _availableSeatWidget(context),
            SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            _choosePickupPointWidget(context),
            SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            _seatDetailsCostWidget(context)
          ],
        ),
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          decoration: BoxDecoration(gradient: CustomStyle.bgColor, borderRadius: BorderRadius.circular(Dimensions.radius)),
          child: Center(
            child: Text(
              Strings.confirmBooking,
              style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen(bus: widget.bus)));
        },
      ),
    );
  }

  _ticketWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: BusTicketWidget(
        image: widget.bus.image,
        name: widget.bus.name,
        route: widget.bus.route,
        rating: widget.bus.rating,
        environment: widget.bus.environment,
        journeyStart: widget.bus.journeyStart,
        price: widget.bus.price,
      ),
    );
  }

  _availableSeatWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.heightSize,
            bottom: Dimensions.heightSize,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.marginSize),
                child: Row(
                  children: [
                    _seatHintWidget('assets/svg/seat_red.svg', Strings.soldOut),
                    _seatHintWidget('assets/svg/seat_white.svg', Strings.available),
                    _seatHintWidget('assets/svg/seat_green.svg', Strings.selected),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/driver.png',
                    height: 60,
                    fit: BoxFit.fill,
                  )),
              _allTicketWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  _seatHintWidget(String svg, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimensions.marginSize),
      child: Column(
        children: [
          SvgPicture.asset(
            svg,
          ),
          SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _allTicketWidget(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(SlotList.list().length, (index) {
          Slot slot = SlotList.list()[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            // ignore: deprecated_member_use
            child: InkWell(
              splashColor: Colors.blue.withOpacity(0.5),
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    //changed: fix ticket booking logic
                    color: slot.isAvailable
                        ? list[index]
                            ? Colors.white
                            : Colors.green
                        : Colors.red,
                    border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))),
                child: Center(
                  child: Text(
                    '${slot.name}',
                    style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      fontWeight: FontWeight.bold,
                      color: list[index] ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                if (slot.isAvailable == false) {
                  print('already booked');
                  Fluttertoast.showToast(msg: Strings.ticketIsNotAvailable, backgroundColor: Colors.red, textColor: Colors.white);
                } else {
                  setState(() {
                    if (li.length >= 0) {
                      discount = 5.0;
                    }
                    // changed: add and remove logic
                    if (list[index] = !list[index]) {
                      li.remove(slot.name);
                    } else {
                      li.add(slot.name);
                    }

                    // duplicateCheck(li, slot.name);
                    // li.removeWhere((element) => element == slot.name);
                    print('select: ' + li.toString());
                    totalPrice = li.length * 50.0;
                    totalPayable = totalPrice - discount;
                  });
                  //print('you can book this slot: ' + list.toString());
                }
              },
            ),
          );
        }),
      ),
    );
  }

  void getSlotList() {
    int data = SlotList.list().length;
    for (int i = 0; i < data; i++) {
      Slot slot = SlotList.list()[i];
      list.add(slot.isAvailable);

      print('list: ' + list.toString());
    }
  }

  _choosePickupPointWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Container(
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Padding(
          padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.choosePickupPoint,
                style: TextStyle(color: Colors.black, fontSize: Dimensions.smallTextSize),
              ),
              DropdownButton<String>(
                items: pickupPointList.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.defaultTextSize,
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  selectedPickupPoint,
                  style: TextStyle(color: Colors.black, fontSize: Dimensions.defaultTextSize, fontWeight: FontWeight.bold),
                ),
                onChanged: (String? value) {
                  setState(() {
                    selectedPickupPoint = value!;
                  });
                },
                underline: Container(),
                isExpanded: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  _seatDetailsCostWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bokedSeat(li.toString(), totalPrice),
          _data(Strings.discount, discount),
          Divider(
            color: Colors.grey,
          ),
          _data(Strings.total.toUpperCase(), totalPayable),
        ],
      ),
    );
  }

//changed: adding wrap for
  _bokedSeat(String title, double price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.heightSize * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Slected Seat :",
            style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.spaceBetween,
              children: List.generate(
                  title.length,
                  (index) => Text(
                        title[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.largeTextSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ))),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Amount'),
              Text(
                '\E${price.toString()}',
                style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _data(String title, double price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.heightSize * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize),
          ),
          Text(
            '\E${price.toString()}',
            style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize),
          ),
        ],
      ),
    );
  }
}

void duplicateCheck(List li, String name) {}
