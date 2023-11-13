import 'package:bustick/data/bus.dart';
import 'package:bustick/screens/seat_plan_screen.dart';
import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/back_widget.dart';
import 'package:bustick/widgets/my_rating.dart';
import 'package:flutter/material.dart';

class BusDetailsScreen extends StatefulWidget {
  final Bus bus;

  BusDetailsScreen({required this.bus});

  @override
  _BusDetailsScreenState createState() => _BusDetailsScreenState();
}

class _BusDetailsScreenState extends State<BusDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            BackWidget(
              title: Strings.busDetails,
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
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _busInfoWidget(context),
            _detailsWidget(context),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            _reviewWidget(context),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            _pickupPointWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _titleContainer(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
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
              Strings.bookingTicket,
              style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SeatPlanScreen(
                    bus: widget.bus,
                  )));
        },
      ),
    );
  }

  _busInfoWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            right: Dimensions.marginSize,
            child: Image.asset(widget.bus.image.toString()),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    color: CustomColor.primaryColor,
                    size: 20.0,
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Text(
                    Strings.journeyStart,
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Text(
                    widget.bus.journeyStart.toString(),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: CustomColor.primaryColor,
                        size: 20.0,
                      ),
                      SizedBox(
                        height: Dimensions.heightSize * 0.5,
                      ),
                      Text(
                        Strings.fromTo,
                        style: TextStyle(color: Colors.black.withOpacity(0.7)),
                      ),
                      SizedBox(
                        height: Dimensions.heightSize * 0.5,
                      ),
                      Text(
                        widget.bus.route.toString(),
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Dimensions.heightSize * 0.5,
                      ),
                      Row(
                        children: [
                          MyRating(
                            rating: widget.bus.rating ?? 5,
                          ),
                          SizedBox(
                            width: Dimensions.widthSize * 0.5,
                          ),
                          Text(
                            widget.bus.rating.toString(),
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\E',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.bus.price.toString(),
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: Dimensions.extraLargeTextSize * 1.3),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _detailsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer('${Strings.about} ${widget.bus.name}'),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        Text(widget.bus.info.toString())
      ],
    );
  }

  _reviewWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer(Strings.review),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.bus.rating.toString(),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: Dimensions.extraLargeTextSize * 1.3),
            ),
            Text(
              '/5.0',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        _reviewTitle(Strings.punctuality, widget.bus.rating ?? 5),
        _reviewTitle(Strings.servicesStaff, 4.0),
        _reviewTitle(Strings.busCleanLines, 3.5),
        _reviewTitle(Strings.comfort, 4.0),
      ],
    );
  }

  _reviewTitle(String value, double rating) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyRating(
                rating: rating,
              ),
              Text(
                rating.toString(),
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  _pickupPointWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer(Strings.pickupPoint),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        _pointTitle('Mbabane Bus Rank', '8:30'),
        _pointTitle('Manzini Bus Rank', '10:30'),
        _pointTitle('Nhlangano City', '07:15'),
      ],
    );
  }

  _pointTitle(String title, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.heightSize * 0.5),
      child: Row(
        children: [
          Image.asset('assets/images/bus.png'),
          SizedBox(
            width: Dimensions.widthSize,
          ),
          Text(
            '$title ($time)',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
