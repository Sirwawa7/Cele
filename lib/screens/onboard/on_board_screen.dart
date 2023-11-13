import 'package:bustick/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/utils/colors.dart';
import 'data.dart';
import 'package:bustick/screens/intro_screen.dart';

class OnBoardScreen extends StatefulWidget {
  final OnBoardingItem initialItem;

  OnBoardScreen({required this.initialItem});

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}
const String copyrightMessage = "© 2023 Wandile and Maxwell. All rights reserved.";

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = 1; // Since we are displaying only one item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: CustomStyle.bgColor),
        child: PageView.builder(
          itemCount: totalPages,
          itemBuilder: (context, index) {
            OnBoardingItem oi = widget.initialItem; // Use the provided initialItem
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: Dimensions.heightSize * 6, bottom: Dimensions.heightSize),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            oi.image != null
                                ? Image.asset(
                              oi.image!,
                            )
                                : SizedBox.shrink(),
                            SizedBox(
                              height: Dimensions.heightSize,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: Dimensions.marginSize * 2.5, right: Dimensions.marginSize * 2.5),
                              child: Text(
                                oi.title.toString(),
                                style: TextStyle(color: Colors.white, fontSize: Dimensions.extraLargeTextSize * 1.2, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: Dimensions.marginSize * 2, right: Dimensions.marginSize * 2),
                              child: Text(
                                oi.subTitle.toString(),
                                style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: Dimensions.buttonHeight,
                                  width: 200,
                                  decoration: BoxDecoration(color: CustomColor.accentColor, borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))),
                                  child: Center(
                                    child: Text(
                                      Strings.getStarted.toUpperCase(),
                                      style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroScreen()));
                              },
                            ),


                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
