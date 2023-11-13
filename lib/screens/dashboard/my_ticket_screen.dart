import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/bus_ticket_widget.dart';
import 'package:bustick/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class MyTicketScreen extends StatefulWidget {


  @override
  _MyTicketScreenState createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: Stack(
          children: [
            HeaderWidget(title: Strings.myTicket,),
            bodyWidget(context),
            buttonWidget(context)
          ],
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
        bottom: 70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _ticketWidget(context),
        ],
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/pdf.png'
                  ),
                  Text(
                    Strings.downloadPdf,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.defaultTextSize,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {

            },
          ),
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/gdrive.png'
                  ),
                  Text(
                    Strings.googleDrive,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.defaultTextSize,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {

            },
          ),
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/share.png'
                  ),
                  Text(
                    Strings.shareTicket,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.defaultTextSize,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {

            },
          ),
        ],
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
        image: 'assets/images/qrcode.png',
        name: 'Emavulane Bus Service',
        route: 'Piggs Peak to Mbabane',
        rating: 5,
        environment: 'AC',
        journeyStart: 'Piggs Peak Bus Stand (8:30)',
        price: 95,
      ),
    );
  }

}
