import 'package:flutter/material.dart';

import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/widgets/back_widget.dart';
import 'package:bustick/screens/auth/otp/email_verification_screen.dart';
import 'package:bustick/screens/auth/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController(); // Add this line
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                  title: Strings.createAnAccount,
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
      children: [inputFieldWidget(context), termsConditionWidget(context), SizedBox(height: Dimensions.heightSize * 2), buttonWidget(context), SizedBox(height: Dimensions.heightSize * 2), SizedBox(height: Dimensions.heightSize * 2), alreadyHaveAccountWidget(context)],
    );
  }

  Future<bool> _showTermsConditions() async {
    return (await showDialog(
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomColor.primaryColor,
            child: Stack(
              children: [
                Positioned(top: -35.0, left: -50.0, child: Image.asset('assets/images/splash_logo.png')),
                Positioned(right: -35.0, bottom: -20.0, child: Image.asset('assets/images/splash_logo.png')),
                Padding(
                  padding: const EdgeInsets.only(top: Dimensions.defaultPaddingSize * 2, bottom: Dimensions.defaultPaddingSize * 2),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: AlertDialog(
                        content: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 45,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  Strings.ourPolicyTerms,
                                  style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'By accessing or using the Mobile Bus Ticketing and Management App ("the App"), you agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use the App.',
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'The App provides users with the ability to book bus tickets, track bus routes, and access other related services. ',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'You may need to create an account to use certain features of the App. When creating an account, you agree to provide accurate and complete information.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'You must notify us immediately if you suspect any unauthorized use of your account.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Text(
                                  'Ticket Booking and Payment',
                                  style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'You may use the App to book bus tickets and make payments through the MTN Mobile Money payment gateway. All transactions are subject to the terms and conditions of the MTN Mobile Money service. Payments made via the App are non-refundable unless otherwise specified in the refund policy.',
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  'Prohibited Activities',
                                  style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'You agree not to:',
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Use the App for any illegal or unauthorized purpose.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Violate any local, regional, national (Kingdom of Eswatini), or international laws.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Engage in any activity that disrupts or interferes with the functionality of the App.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: CustomColor.accentColor, fontSize: Dimensions.extraLargeTextSize),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Attempt to gain unauthorized access to our systems or user accounts.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(color: CustomColor.secondaryColor, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                      child: Center(
                                        child: Text(
                                          Strings.decline,
                                          style: TextStyle(color: Colors.white, fontSize: Dimensions.defaultTextSize, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(color: CustomColor.primaryColor, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                      child: Center(
                                        child: Text(
                                          Strings.agree,
                                          style: TextStyle(color: Colors.white, fontSize: Dimensions.defaultTextSize, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        )) ??
        false;
  }

  inputFieldWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimensions.heightSize * 2,
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
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
              'Name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0, // Adjust the font size as needed
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            TextFormField(
              style: CustomStyle.textStyle,
              controller: nameController, // Create a TextEditingController for the name
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please fill out the field';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                labelStyle: CustomStyle.textStyle,
                focusedBorder: CustomStyle.focusBorder,
                enabledBorder: CustomStyle.focusErrorBorder,
                focusedErrorBorder: CustomStyle.focusErrorBorder,
                errorBorder: CustomStyle.focusErrorBorder,
                filled: true,
                fillColor: Colors.transparent,
                hintStyle: CustomStyle.textStyle,
                prefixIcon: Icon(Icons.person),
              ),
            ),
            Text(
              'Phone Number',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0, // Adjust the font size as needed
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Row(
              children: [
                Text(
                  '+268', // Swaziland dialing code
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0, // Adjust the font size as needed
                  ),
                ),
                SizedBox(width: 10.0),
                Flexible(
                  child: TextFormField(
                    style: CustomStyle.textStyle,
                    controller: phoneController, // Create a TextEditingController for the phone number
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please fill out the field';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your MTN Mobile Money number',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintStyle: CustomStyle.textStyle,
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
              ],
            ),





            SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0, // Adjust the font size as needed
              ),
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
                  return 'Please fill out the field';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
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
              'Password',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0, // Adjust the font size as needed
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            TextFormField(
              style: CustomStyle.textStyle,
              controller: passwordController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please fill out the field';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'Type your password',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
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
      ),
    );
  }


  termsConditionWidget(BuildContext context) {
    return CheckboxListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "By clicking sign up you agree to the following ",
            style: CustomStyle.textStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Text(
                  "Terms and Conditions",
                  style: TextStyle(fontSize: Dimensions.defaultTextSize, fontWeight: FontWeight.bold, color: CustomColor.blueColor, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  print('go to privacy url');
                  _showTermsConditions();
                },
              ),
              Text(
                ". Read carefully",
                style: CustomStyle.textStyle,
              ),
            ],
          )
        ],
      ),
      value: checkedValue,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
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
              Strings.createAnAccount.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          // Check if the form is valid and the terms are accepted before navigating
          if (formKey.currentState!.validate() && checkedValue) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EmailVerificationScreen(
                emailAddress: emailController.text,
              ),
            ));
          } else {
            // If terms are not accepted, show an error or prompt the user
            // You can customize this part based on your UI/UX requirements
            print('Please accept the terms and conditions.');
          }
        },
      ),
    );
  }



  alreadyHaveAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.alreadyHaveAnAccount,
          style: CustomStyle.textStyle,
        ),
        GestureDetector(
          child: Text(
            Strings.signIn.toUpperCase(),
            style: TextStyle(color: CustomColor.primaryColor, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen()));
          },
        )
      ],
    );
  }
}
