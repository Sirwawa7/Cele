import 'package:bustick/data/bus.dart';
import 'package:bustick/screens/dashboard/my_ticket_screen.dart';
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/back_widget.dart';
import 'package:bustick/widgets/bus_ticket_widget.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final Bus bus;

  PaymentScreen({required this.bus});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String expDate = 'exp date';
  List<String> typeList = ['Master Card', 'Visa Card', 'Credit Card'];
  late String selectedCard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedCard = typeList[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: Stack(
          children: [
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
            _seatDetailsCostWidget(context),
            SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            _inputFieldWidget(context)
          ],
        ),
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: CustomStyle.textStyle,
            ),
            SizedBox(height: Dimensions.heightSize * 0.5),
            Row(
              children: [
                Text(
                  '+268',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    style: CustomStyle.textStyle,
                    controller: numberController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please fill out the field';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'MTN Mobile Money number',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: CustomStyle.textStyle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.heightSize),
            Text(
              'MTN MoMo Holder Name',
              style: CustomStyle.textStyle,
            ),
            SizedBox(height: Dimensions.heightSize * 0.5),
            TextFormField(
              style: CustomStyle.textStyle,
              controller: nameController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please fill out the field';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelStyle: CustomStyle.textStyle,
                focusedBorder: CustomStyle.focusBorder,
                enabledBorder: CustomStyle.focusErrorBorder,
                focusedErrorBorder: CustomStyle.focusErrorBorder,
                errorBorder: CustomStyle.focusErrorBorder,
                filled: true,
                fillColor: Colors.white,
                hintStyle: CustomStyle.textStyle,
              ),
            ),
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
              Strings.payNow,
              style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          openPaymentSuccessDialog(context);
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

  _seatDetailsCostWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          _data(Strings.seat + 'A1, A2', 100),
          _data(Strings.discount, 5),
          Divider(
            color: Colors.grey,
          ),
          _data(Strings.total.toUpperCase(), 95.0),
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
            '\$${price.toString()}',
            style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize),
          ),
        ],
      ),
    );
  }

  openPaymentSuccessDialog(BuildContext context) {
    showGeneralDialog(
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.4),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 12, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/payment_success.png'),
                      SizedBox(height: Dimensions.heightSize),
                      Text(
                        Strings.paymentSuccess,
                        style: TextStyle(fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.5),
                      Text(
                        Strings.theSystemIsWaitingForTheTicket,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: Dimensions.heightSize * 2),
                      GestureDetector(
                        child: Container(
                          height: Dimensions.buttonHeight,
                          width: 150,
                          decoration: BoxDecoration(gradient: CustomStyle.bgColor, borderRadius: BorderRadius.circular(Dimensions.radius)),
                          child: Center(
                            child: Text(
                              Strings.showTicket.toUpperCase(),
                              style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyTicketScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        });
  }
}
