import 'dart:convert';

import 'package:apex_cpd/domain/entities/cpd/cpd.dart';

import '../../../domain/entities/skills/skills.dart';
import '../../../domain/entities/training/training.dart';
import '../../../domain/entities/user/user.dart';

TrainingFormatModel trainingFormatModelFromJson (String str) =>
    TrainingFormatModel.fromJson(json.decode(str)['data']);
List<TrainingFormatModel> trainingFormatModelListFromJson(String str) =>
    List<TrainingFormatModel>.from(
        json.decode(str)['data'].map((x) => TrainingFormatModel.fromJson(x)));

String trainingFormatModelToJson(TrainingFormatModel data) => json.encode(data.toJson());

class TrainingFormatModel extends TrainingFormat {
  const TrainingFormatModel({
    required super.id,
  required super.name,
  
 
  });

  factory TrainingFormatModel.fromJson(Map<String, dynamic> json) => TrainingFormatModel(
   id:json['id'],
    name: json['name'],
    
  );

  Map<String, dynamic> toJson() => {
   "id": id,
    "name": name,
   
  };
}
