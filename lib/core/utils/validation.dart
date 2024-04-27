import 'package:flutter/material.dart';

import '../constant/strings.dart';


class Validation{
 String? Function(String?)? usernameValidator = (String? username){
        if(username!.isEmpty){
        
            return "don't leave blank field";
          
        
        }else if(username.length < 3){
            return "write full name";
          
        }

        return null;
  };
    validateEmail(BuildContext ?context,String ?value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex =  RegExp(pattern.toString());
    if (!regex.hasMatch(value!))
      return "Enter Valide email address"; //translation(context!).name;
    else
      return null!;
  }
    String? Function(String?)? validateMobile=(String ?value) {

      if(value!.isEmpty){
          return "don't leave blank field";
         
        }else if (value.length != 10)  {
return "phone number has to be 10 number";
      }
    else
      return null;
  };
  String? Function(String?)?  passwordValidator=(String ?password){
        if (password!.isEmpty) {
          ResConstants.kPassNullError;
          return ResConstants.kPassNullError;
        } else if (password.length < 8) {
         ResConstants.kShortPassError;
          return ResConstants.kShortPassError;
        }
        return null;
  } ;
 
String  changePass(String pass){
return pass;
 }
}
 