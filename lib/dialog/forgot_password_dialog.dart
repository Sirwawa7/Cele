import 'package:flutter/material.dart';

import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/utils/custom_style.dart';

final TextEditingController emailController = TextEditingController();

class MyDialog {
  static forgotPassword(BuildContext context) async {
    return (await showDialog(
          barrierDismissible: true,
          context: context,
          barrierColor: Colors.black.withOpacity(0.6),
          builder: (context) => new AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.forgotPassword,
                    style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.email,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: Dimensions.heightSize * 0.5,
                      ),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return Strings.pleaseFillOutTheField;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: Strings.demoEmail,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          filled: true,
                          fillColor: CustomColor.accentColor,
                          hintStyle: CustomStyle.textStyle,
                          focusedBorder: CustomStyle.focusBorder,
                          enabledBorder: CustomStyle.focusErrorBorder,
                          focusedErrorBorder: CustomStyle.focusErrorBorder,
                          errorBorder: CustomStyle.focusErrorBorder,
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: CustomColor.primaryColor, borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))),
                      child: Center(
                        child: Text(
                          Strings.sendCode.toUpperCase(),
                          style: TextStyle(fontSize: Dimensions.extraLargeTextSize, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
        )) ??
        false;
  }
}
