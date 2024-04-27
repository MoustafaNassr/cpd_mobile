import 'dart:convert';

import '../../../core/constant/assets.dart';
import '../../../domain/entities/user/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String professionTitle,
    required String email,
    required String profile_image,
    
  }) : super(
    id: id,
    firstName: firstName,
    lastName: lastName,
    professionTitle: professionTitle,
    email: email,
    profile_image: profile_image
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    professionTitle:  json["profession_title"] ,
    email: json["email"],
    profile_image: json["profile_image"] ?? ResAssets.user
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "profession_title" : professionTitle,
    "email": email,
    "profile_image":profile_image
  };
}
