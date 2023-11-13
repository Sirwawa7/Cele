import 'package:bustick/card/ticket_card.dart';
import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

import 'my_rating.dart';

class BusTicketWidget extends StatelessWidget {
  final String? image;
  final String? name;
  final String? route;
  final double? rating;
  final String? environment;
  final String? journeyStart;
  final double? price;

  BusTicketWidget({this.image, this.name, this.route, this.rating, this.environment, this.journeyStart, this.price});

  @override
  Widget build(BuildContext context) {
    return TicketCard(
      decoration: TicketDecoration(
        shadow: [TicketShadow(color: Colors.grey, elevation: 6)],
        border: TicketBorder(color: Colors.indigo, width: 0.1, style: TicketBorderStyle.dotted),
      ),
      lineFromTop: 110,
      lineColor: Colors.grey,
      lineRadius: 15,
      child: Container(
        height: 250,
        //width: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ticketTopPart(),
              _ticketBottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  _ticketTopPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          image.toString(),
          height: 60,
          width: 60,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              name.toString(),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: Dimensions.largeTextSize),
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Text(
              route.toString(),
              style: TextStyle(
                color: CustomColor.primaryColor,
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Row(
              children: [
                MyRating(
                  rating: rating ?? 0.0,
                ),
                SizedBox(
                  width: Dimensions.widthSize,
                ),
                Text(
                  rating.toString(),
                  style: TextStyle(color: CustomColor.primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  _ticketBottomPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/ac.png'),
                SizedBox(
                  width: Dimensions.widthSize * 0.5,
                ),
                Text(
                  environment.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/images/chair.png'),
                SizedBox(
                  width: Dimensions.widthSize * 0.5,
                ),
                Text(
                  '2/2',
                  style: TextStyle(color: Colors.black),
                ),
              ],
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
                  journeyStart.toString(),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
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
                  price.toString(),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: Dimensions.extraLargeTextSize * 1.3),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
