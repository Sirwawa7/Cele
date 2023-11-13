import 'package:flutter/material.dart';
import 'package:bustick/utils/dimensions.dart';

class BackWidget extends StatefulWidget {
  final String title;

  const BackWidget({Key? key, required this.title}) : super(key: key);

  @override
  _BackWidgetState createState() => _BackWidgetState();
}

class _BackWidgetState extends State<BackWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                ),
                SizedBox(
                  width: Dimensions.widthSize,
                ),
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
