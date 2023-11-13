import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/data/notifications.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

//changed: stack to colum ✔
class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                HeaderWidget(
                  title: Strings.notifications,
                ),
                bodyWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: NotificationList.list().length,
        itemBuilder: (context, index) {
          Notifications notification = NotificationList.list()[index];
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
            ),
            child: GestureDetector(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.primaryColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Expanded(
                            // flex: 1,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.widthSize,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: Dimensions.largeTextSize, color: Colors.black),
                                ),
                                SizedBox(
                                  height: Dimensions.heightSize * 0.5,
                                ),
                                Text(
                                  notification.subTitle.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: Dimensions.smallTextSize, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            notification.time.toString(),
                            style: TextStyle(color: CustomColor.greyColor),
                          ),
                        ))
                  ],
                ),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
