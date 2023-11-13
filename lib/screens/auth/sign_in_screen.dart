import 'package:flutter/material.dart';

import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/widgets/back_widget.dart';
import 'package:bustick/screens/auth/sign_up_screen.dart';
import 'package:bustick/dialog/forgot_password_dialog.dart';
import 'package:bustick/driver/driver_screen.dart';
import 'package:bustick/owner/owner_screen.dart';

import '../dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;
  String? userType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackWidget(
                  title: Strings.signInAccount,
                ),
                bodyWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [inputFieldWidget(context), rememberForgotWidget(context), SizedBox(height: Dimensions.heightSize * 2), buttonWidget(context), SizedBox(height: Dimensions.heightSize * 2), SizedBox(height: Dimensions.heightSize * 2), newHereWidget(context)],
    );
  }

  inputFieldWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: Dimensions.heightSize * 2, left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Type:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0, // Adjust the font size as needed
                ),
              ),
              DropdownButtonFormField<String>(
                value: userType,
                onChanged: (String? value) {
                  setState(() {
                    userType = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a user type';
                  } else {
                    return null;
                  }
                },
                hint: Text('Select'),
                items: [
                  DropdownMenuItem(
                    value: 'Passengers',
                    child: Text('Passengers', style: TextStyle(color: Colors.black)),
                  ),
                  DropdownMenuItem(
                    value: 'Drivers',
                    child: Text('Drivers', style: TextStyle(color: Colors.black)),
                  ),
                  DropdownMenuItem(
                    value: 'Owner',
                    child: Text('Owner', style: TextStyle(color: Colors.black)),
                  ),
                  DropdownMenuItem(
                    value: 'Owner-driver',
                    child: Text('Owner-driver', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
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
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Text(
                Strings.password,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: Dimensions.heightSize * 0.5,
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                  ),
                ),
                obscureText: _toggleVisibility,
              ),
              SizedBox(height: Dimensions.heightSize),
            ],
          ),
        ));
  }

  rememberForgotWidget(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            Strings.rememberMe,
            style: CustomStyle.textStyle,
          ),
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        GestureDetector(
          child: Text(
            Strings.forgotPassword,
            style: TextStyle(
              color: Colors.deepOrangeAccent, // Set the color to green
            ),
          ),
          onTap: () {
            MyDialog.forgotPassword(context);
          },
        ),
      ],
    );
  }


  buttonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: GestureDetector(
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: CustomStyle.bgColor, borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))),
          child: Center(
            child: Text(
              Strings.signInAccount.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          // Check if the form is valid
          if (formKey.currentState!.validate()) {
            // Form is valid, proceed with sign-in logic
            // You can access user type, email, and password using the controllers
            String? selectedUserType = userType; // Rename to avoid conflict
            String? email = emailController.text;
            String? password = passwordController.text;

            if (selectedUserType == 'Drivers') {
              // Navigate to the driver screen
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriverScreen()));
            } else if (selectedUserType == 'Owner') {
              // Navigate to the owner screen
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OwnerScreen()));
            } else if (selectedUserType == 'Passengers') {
              // Navigate to the passenger screen (assuming HomeScreen is for passengers)
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DashboardScreen()));
            } else if (selectedUserType == 'Owner-driver') {
              // Navigate to the owner screen
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OwnerScreen()));
            }
            else {
              // Handle other user types or show an error message
            }
          }
        },
      ),
    );
  }



  newHereWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.ifYouHaveNoAccount,
              style: CustomStyle.textStyle,
            ),
            GestureDetector(
              child: Text(
                Strings.signUp.toUpperCase(),
                style: TextStyle(color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        // Add some space between the text and the image
      ],
    );
  }
}
