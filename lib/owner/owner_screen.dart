import 'package:bustick/screens/auth/sign_in_screen.dart';
import 'package:bustick/screens/customer_feedback_screen.dart';
import 'package:bustick/screens/drawer/change_password_screen.dart';
import 'package:bustick/screens/drawer/gift_card_screen.dart';
import 'package:bustick/screens/drawer/my_profile_screen.dart';
import 'package:bustick/screens/drawer/support_screen.dart';
import 'package:bustick/screens/search_result_screen.dart';
import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bustick/owner/subscription.dart';
import 'package:bustick/driver/scan_ticket.dart';
import 'package:bustick/owner/remove_bus.dart';
import 'package:bustick/owner/owner_notification.dart';
import 'package:bustick/owner/subscription.dart';
import 'package:bustick/owner/add_bus.dart';
import 'package:bustick/owner/bookings.dart';
import 'package:bustick/owner/rate_us.dart';


import 'package:flutter/material.dart';

class OwnerScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<OwnerScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget profileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.heightSize * 3,
      ),
      child: ListTile(
        leading: Image.asset(
          'assets/images/user.png',
        ),
        title: Text(
          Strings.demoName,
          style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          Strings.demoEmail,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.defaultTextSize,
          ),
        ),
        onTap: () {
          // Add logic to navigate to MyProfileScreen
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfileScreen()));
        },
      ),
    );
  }

  Widget listData(String imagePath, String title, Widget screen) {
    return ListTile(
      leading: Image.asset(imagePath),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop();  // Close the drawer
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              //portant: Remove any padding from the ListView.
              //padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: profileWidget(context),
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                  ),
                ),
                listData('assets/images/icon/10.png', Strings.scanqrcode, ScanTicketsScreen()),
                listData('assets/images/icon/ticket.png', Strings.rate_us, RateUs()),
                listData('assets/images/icon/9.png', Strings.notifications, OwnerNotificationScreen()),
                listData('assets/images/icon/1.png', Strings.addbus, AddBus()),
                listData('assets/images/icon/5.png', Strings.bookings, BookingScreen()),
                listData('assets/images/icon/2.png', Strings.remove_bus, RemoveBusScreen()),
                listData('assets/images/icon/3.png', Strings.subscription, SubscriptionScreen()),
                listData('assets/images/icon/headphone.png', Strings.support, SupportScreen()),
                listData('assets/images/icon/lock.png', Strings.changePassword, ChangePasswordScreen()),
                listData('assets/images/icon/logout.png', Strings.logOut, SignInScreen()),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                headerWidget(context),
                dashboardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
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
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                height: 20,
                width: 20,
                child: Image.asset('assets/images/menu.png'),
              ),
              onTap: () {
                if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
                  scaffoldKey.currentState!.openEndDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
            Container(
              height: 40,
              width: 40,
              child: Image.asset('assets/images/onboard/12.png'),
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/user.png'),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfileScreen()));// Handle user profile tap...
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardWidget() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          DashboardItem (icon: '11.png', title: 'Customers', value: '300'),
          DashboardItem(icon: '22.png', title: 'Total Bookings', value: '100'),
          DashboardItem(icon: '33.png', title: 'Date', value: 'October 27, 2023'),
          DashboardItem(icon: '44.png', title: 'Buses', value: '10'),
          DashboardItem(icon: '55.png', title: 'Balance', value: 'E3000.00'),
          DashboardItem(icon: '66.png', title: 'Feedback', value: '300'),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  DashboardItem({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$icon', height: 60.0),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.0),
          Text(value),
        ],
      ),
    );
  }
}
