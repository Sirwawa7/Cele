
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/back_widget.dart';
import 'package:flutter/material.dart';
class SupportScreen extends StatefulWidget {


  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

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
            BackWidget(title: Strings.support,),
            bodyWidget(context),
            //buttonWidget(context)
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
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Strings.weAreHereToHelpYou
          ),
          listData('assets/images/messenger.png', Strings.clickHereForMessenger),
          listData('assets/images/mail.png', Strings.clickHereToMailUs),
          listData('assets/images/support.png', Strings.customerCare),
        ],
      ),
    );
  }

  listData(String icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: Dimensions.heightSize
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius)
        ),
        child: ListTile(
          leading: Image.asset(
              icon
          ),
          title: Text(
            title,
            style: CustomStyle.listStyle,
          ),
        ),
      ),
    );
  }

}
