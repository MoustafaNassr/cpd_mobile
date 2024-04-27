
import 'package:flutter/material.dart';

class ResConstants {
  ResConstants._();

  static const appName = "App name";
  static String baseUrl = 'magento.test';
 static const kSecondaryColor = Color(0xFF979797);
static const kTextColor = Color(0xFF757575);

static const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = const TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

static const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
static const String kEmailNullError = "Please Enter your email";
static const String kInvalidEmailError = "Please Enter Valid Email";
static const String kPassNullError = "Please Enter your password";
static const String kShortPassError = "Password is too short";
static const String kMatchPassError = "Passwords don't match";
static const String kFNamelNullError = "Please Enter your First name";
static const String kLNamelNullError = "Please Enter your Last name";
static const String kPhoneNumberNullError = "Please Enter your phone number";
static const String kAddressNullError = "Please Enter your address";
static const String introTitle = " Intro Title";
static const String introDescription="Out too the been like hard off. Improve enquire welcome own beloved matters her. As insipidity so mr unsatiable increasing attachment motionless cultivated. Addition mr husbands unpacked occasion he oh. Is unsatiable if projecting boisterous insensible. It recommend be resolving pretended middleton.";
// final otpInputDecoration = InputDecoration(
//   contentPadding:
//       EdgeInsets.symmetric(vertical: 15),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
//);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
  );
}}
