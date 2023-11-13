import 'package:bustick/data/bus.dart';
import 'package:bustick/screens/bus_details_screen.dart';
import 'package:bustick/screens/filter_screen.dart';
import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/bus_ticket_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              headerWidget(context),
              bodyWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child:  Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: CustomColor.primaryColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  Text(
                    Strings.searchResults,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.largeTextSize,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.search,
                      color: CustomColor.primaryColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  GestureDetector(
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: CustomColor.primaryColor,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      FilterScreen()));
                    },
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: BusList.list().length,
          itemBuilder: (context, index){
            Bus bus = BusList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                bottom: Dimensions.heightSize * 2,
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
              ),
              child: GestureDetector(
                child: BusTicketWidget(
                  image: bus.image,
                  name: bus.name,
                  route: bus.route,
                  rating: bus.rating,
                  environment: bus.environment,
                  journeyStart: bus.journeyStart,
                  price: bus.price,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      BusDetailsScreen(bus: bus)));
                },
              ),
            );
          },
        ),
      ),
    );
  }

}
