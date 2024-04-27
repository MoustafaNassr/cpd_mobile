import 'dart:convert';

import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:apex_cpd/domain/entities/training/training.dart';

import '../../../domain/entities/user/user.dart';
import '../training/training_model.dart';

CpdDataModel cpdModelFromJson (String str) =>
    CpdDataModel.fromJson(json.decode(str)['data']);
List<CpdDataModel> cpdModelListFromJson(String str) =>
    List<CpdDataModel>.from(
        json.decode(str)['data'].map((x) => CpdDataModel.fromJson(x)));

String cpdModelToJson(CpdDataModel data) => json.encode(data.toJson());

class CpdDataModel extends CPDData {
  const CpdDataModel({
    required String date,
  required String title,
  required String type,
    required   SkillsModel  skills_area,
    required   TrainingFormatModel  format_of_training,
  required int hours_logged,
  required String date_completed,
  required int cost_of_cpd,
  required String what_did_you_learn,
  required String future_dev_nots,
  required String file,
  }) : super(
    date: date,
    title: title,
    type:type,
    skills_area: skills_area,
    format_of_training: format_of_training,
    hours_logged:hours_logged,
    date_completed:date_completed,
    cost_of_cpd:cost_of_cpd,
    what_did_you_learn:what_did_you_learn,
    future_dev_nots:future_dev_nots,
    file:file
   
  );

  factory CpdDataModel.fromJson(Map<String, dynamic> json) => CpdDataModel(
   date:json['date'],
    title: json['title'],
    type:json['type'],
    skills_area: SkillsModel.fromJson(json[ 'skills_area']),
    format_of_training:TrainingFormatModel.fromJson(json['format_of_training']),
    hours_logged:json['hours_logged'],
    date_completed:json['date_completed'],
    cost_of_cpd:json['cost_of_cpd'],
    what_did_you_learn:json['what_did_you_learn'],
    future_dev_nots:json['future_dev_nots'],
    file:json['file']
  );

  Map<String, dynamic> toJson() => {
   "date": date,
    "title": title,
    "type":type,
    "skills_area":skills_area.id,
    'format_of_training':format_of_training.id,
    "hours_logged":hours_logged,
    "date_completed":date_completed,
    "cost_of_cpd":cost_of_cpd,
    "what_did_you_learn":what_did_you_learn,
    "future_dev_nots":future_dev_nots,
    "file":file
  };
}
