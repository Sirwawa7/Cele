import 'package:bustick/utils/colors.dart';
import 'package:bustick/utils/custom_style.dart';
import 'package:bustick/utils/dimensions.dart';
import 'package:bustick/utils/strings.dart';
import 'package:bustick/widgets/back_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  XFile? _image, file;
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
            BackWidget(
              title: Strings.myProfile,
            ),
            bodyWidget(context),
            buttonWidget(context)
          ],
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
        bottom: 70,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius),
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5.0, offset: Offset(0.0, 0.0))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.marginSize),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                addImageWidget(context),
                _typeData(Strings.userName, Strings.demoName),
                _typeData(Strings.emailAddress, Strings.demoEmail),
                _typeData(Strings.phoneNumber, Strings.demoPhoneNumber),
                _typeData(Strings.address, Strings.demoAddress),
                _typeData(Strings.lifetimeInsurance, 'Yes'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addImageWidget(BuildContext context) {
    final Object image;
    if (_image != null) {
      image = FileImage(File(_image!.path));
    } else {
      image = Image.asset('assets/images/user.png', fit: BoxFit.cover);
    }
    return Align(
      alignment: Alignment.center,
      child: Stack(children: <Widget>[
        Container(
            height: 150,
            width: 150,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: CustomColor.secondaryColor,
              borderRadius: BorderRadius.circular(75.0),
            ),
            child: _image == null ? Image.asset('assets/images/user.png', fit: BoxFit.cover) : Ink.image(image: image as ImageProvider)),
        Positioned(
          right: 0,
          bottom: 20,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(color: CustomColor.primaryColor, borderRadius: BorderRadius.circular(20.0)),
            margin: const EdgeInsets.only(bottom: 20),
            child: IconButton(
              onPressed: () {
                _openImageSourceOptions(context);
              },
              padding: EdgeInsets.only(left: 5, right: 5),
              iconSize: 24,
              icon: Icon(
                Icons.camera_enhance,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> _openImageSourceOptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.camera_alt,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    // _chooseFromCamera();
                  },
                ),
                GestureDetector(
                  child: Icon(
                    Icons.photo,
                    size: 40.0,
                    color: Colors.green,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _openGallery(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);
    setState(() {
      // Get.find<ProfileController>().imageFile = File(result!.files.single.path!);
      _image = XFile(result!.files.single.path!);
    });
  }

  // void _chooseFromGallery() async {
  //   // ignore: deprecated_member_use
  //   file = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 40);

  //   if (file == null) {
  //     Fluttertoast.showToast(msg: 'No File Selected');
  //   } else {
  //     setState(() {
  //       _image = file;
  //     });
  //     //_upload();
  //   }
  // }

  // _chooseFromCamera() async {
  //   print('open camera');
  //   //ignore: deprecated_member_use
  //   file = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 20);

  //   print('picked camera');
  //   if (file == null) {
  //     Fluttertoast.showToast(msg: 'No Capture Image');
  //   } else {
  //     setState(() {
  //       _image = file;
  //     });
  //     //_upload();
  //   }
  // }

  buttonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          decoration: BoxDecoration(gradient: CustomStyle.bgColor, borderRadius: BorderRadius.circular(Dimensions.radius)),
          child: Center(
            child: Text(
              Strings.updateProfile,
              style: TextStyle(color: Colors.white, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  _typeData(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.heightSize),
      child: Container(
        // /height: 100,
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: CustomColor.secondaryColor.withOpacity(0.035), borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
            top: Dimensions.heightSize,
            bottom: Dimensions.heightSize,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
