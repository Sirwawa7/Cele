import 'package:bustick/screens/dashboard/my_ticket_screen.dart';
import 'package:bustick/screens/dashboard/notification_screen.dart';
import 'dashboard/home_screen.dart';
import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: new Material(
        elevation: 10,
        //borderRadius: BorderRadius.circular(20),
        child: new BottomNavigationBar(
            //backgroundColor: Colors.white,
            elevation: 25,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: _onTapIndex,
            items: [
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  icon: SvgPicture.asset(
                    'assets/svg/home.svg',
                    color: currentIndex == 0 ? CustomColor.primaryColor : Colors.grey,
                  ),
                  // changed: title to label and name also
                  label: "Home"),
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  icon: SvgPicture.asset(
                    'assets/svg/document.svg',
                    color: currentIndex == 1 ? CustomColor.primaryColor : Colors.grey,
                  ),
                  // ignore: deprecated_member_use
                  label: Strings.myTicket),
              BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: SvgPicture.asset(
                  'assets/svg/notification.svg',
                  color: currentIndex == 2 ? CustomColor.primaryColor : Colors.grey,
                ),
                // ignore: deprecated_member_use
                label: Strings.notifications,
              ),
            ]),
      ),
      body: goToScreen(currentIndex),
    );
  }

  _onTapIndex(index) {
    setState(() {
      currentIndex = index;
      print('index: $index');
    });
    goToScreen(currentIndex);
  }

  goToScreen(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return MyTicketScreen();
      case 2:
        return NotificationScreen();
    }
  }
}
