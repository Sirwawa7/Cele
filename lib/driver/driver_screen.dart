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
import 'package:bustick/driver/driver_screen.dart';
import 'package:bustick/driver/scan_ticket.dart';
import 'package:bustick/driver/driver_notification.dart';
import 'package:bustick/owner/rate_us.dart';

class DriverScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriverScreen()));
            },
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/onboard/8.png'), // Replace with the correct image asset
                ),
                Text('Home'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanTicketsScreen()));
            },
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/onboard/10.png'), // Replace with the correct image asset
                ),
                Text('Scan QR'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Driver_NotificationScreen()));
            },
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/onboard/9.png'), // Replace with the correct image asset
                ),
                Text('Notification'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class YourMainContent {
  // ... other class code ...

  Widget YourMainContentBody() {
    // Your main content body code goes here
    return Container(
      // Your main content body UI components
    );
  }
}








class _HomeScreenState extends State<DriverScreen> {
  List<String> fromCityList = ["Mbabane", "Manzini", "Piggs Peak", "Sikhuphe", "Nhlangano", 'Siteki'];
  List<String> toCityList = ["Mbabane", "Manzini", "Piggs Peak", "Sikhuphe", "Nhlangano", 'Siteki'];
  late String selectedFromCity;
  late String selectedToCity;

  DateTime selectedDate = DateTime.now();
  String date = Strings.selectJourneyDate;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedFromCity = fromCityList[0].toString();
    selectedToCity = fromCityList[1].toString();
  }

// changed: stack to column  solve bottomoverflow issu ,
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
                listData('assets/images/icon/id_card.png', Strings.addIdentity, MyProfileScreen()),
                listData('assets/images/icon/10.png', Strings.scanqrcode, ScanTicketsScreen()),
                listData('assets/images/icon/ticket.png', Strings.rate_us, RateUs()),
                listData('assets/images/icon/9.png', Strings.notifications, Driver_NotificationScreen()),
                listData('assets/images/icon/headphone.png', Strings.support, SupportScreen()),
                Spacer(),
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
            Image.asset('assets/images/home_bg.png'),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: Dimensions.heightSize,
                        bottom: Dimensions.heightSize,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/map.png'),
                          _verticalBorder(context),
                          Image.asset('assets/images/location.png'),
                          _verticalBorder(context),
                          Image.asset('assets/images/calendar.png'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownSearch(
                          mode: Mode.MENU,
                          items: fromCityList,
                          label: "From",
                          onChanged: print,
                          showSearchBox: true,
                          selectedItem: selectedFromCity,
                          validator: (String? item) {
                            if (item == null)
                              return "Required field";
                            else if (item == selectedFromCity)
                              return "Invalid item";
                            else
                              return null;
                          },
                        ),
                        DropdownSearch(
                          mode: Mode.MENU,
                          items: toCityList,
                          label: "To",
                          onChanged: print,
                          showSearchBox: true,
                          selectedItem: selectedToCity,
                          validator: (String? item) {
                            if (item == null)
                              return "Required field";
                            else if (item == selectedToCity)
                              return "Invalid item";
                            else
                              return null;
                          },
                        ),
                        selectDateWidget(context)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: Dimensions.buttonHeight,
                    width: MediaQuery.of(context).size.width / 2 + 40,
                    decoration: BoxDecoration(gradient: CustomStyle.bgColor, borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
                    child: Center(
                      child: Text(
                        'Start Shift',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    _showShiftStatus(context, 'Shift Started Successful');//Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultScreen()));
                  },
                ),

                const SizedBox(
                  height: Dimensions.heightSize,
                ),

                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10), // Adjust the margin as needed
                    height: Dimensions.buttonHeight,
                    width: MediaQuery.of(context).size.width / 2 + 40,
                    decoration: BoxDecoration(gradient: CustomStyle.bgColor, borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
                    child: Center(
                      child: Text(
                        'End Shift',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    _showShiftStatus(context, 'Shift Ended Successful');// Add the logic for the "End Shift" button here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    ),
    );
  }
  void _showShiftStatus(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Shift Status'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

//attention: change header height menu & profile size :)
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
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                height: 20,
                width: 20,
                child: Image.asset(
                  'assets/images/menu.png',
                ),
              ),
              onTap: () {
                if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
                  scaffoldKey.currentState!.openEndDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
            // Add the middle image here
            Container(
              height: 40,
              width: 40,
              child: Image.asset('assets/images/onboard/7.png'), // Replace 'middle_image.png' with your image asset
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/user.png'),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfileScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }


  profileWidget(BuildContext context) {
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
      ),
    );
  }

  listData(String icon, String title, Widget goTo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.1))),
        child: ListTile(
          leading: Image.asset(icon),
          title: Text(
            title,
            style: CustomStyle.listStyle,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => goTo));
          },
        ),
      ),
    );
  }

  _verticalBorder(BuildContext context) {
    return Container(
      height: 100,
      width: 1,
      child: ListView.builder(
        itemCount: 20,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              height: 5,
              width: 1,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  selectDateWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.4)), borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize * 0.5,
            ),
            child: Text(
              date,
              style: TextStyle(color: Colors.black.withOpacity(0.9)),
            ),
          ),
        ),
      ),
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    // final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime.now(), lastDate: DateTime(2022));
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2023), lastDate: DateTime(2024)) as DateTime;
    if (picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date = "${selectedDate.toLocal()}".split(' ')[0];
        print('date: ' + date);
      });
  }
}
