import 'dart:convert';

import 'package:apex_cpd/domain/entities/cpd/cpd.dart';

import '../../../domain/entities/skills/skills.dart';
import '../../../domain/entities/user/user.dart';

SkillsModel skillsModelFromJson (String str) =>
    SkillsModel.fromJson(json.decode(str)['data']);
List<SkillsModel> skillsModelListFromJson(String str) =>
    List<SkillsModel>.from(
        json.decode(str)['data'].map((x) => SkillsModel.fromJson(x)));

String skillsModelToJson(SkillsModel data) => json.encode(data.toJson());

class SkillsModel extends Skills {
  const SkillsModel({
    required super.id,
  required super.name,
  
 
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
   id:json['id'],
    name: json['name'],
    
  );

  Map<String, dynamic> toJson() {
    return{
   "id": id,
    "name": name,
    
  };
  }
}
