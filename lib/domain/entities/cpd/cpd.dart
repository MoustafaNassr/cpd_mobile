

import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:apex_cpd/data/models/training/training_model.dart';
import 'package:equatable/equatable.dart';


class CPDData extends Equatable{
 const CPDData({
     required this.title,
    required  this.date,
    required  this.type,
    required  this.cost_of_cpd,
    required  this.date_completed,
    required this.skills_area,
    required this.format_of_training,
   required   this.file,
   required   this.future_dev_nots,
    required  this.hours_logged,
    required  this.what_did_you_learn});

  final String date;
  final String title;
  final String type;
   final   SkillsModel  skills_area;
   final   TrainingFormatModel  format_of_training;
  final int hours_logged;
  final String date_completed;
  final int cost_of_cpd;
  final String what_did_you_learn;
  final String future_dev_nots;
  final String file;
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final List<CPDData> cpdData = [
//   CPDData('Certificate A  ', "4-4-2023", ),
//   CPDData(' Certificate B',  "4-4-2023",),
//   CPDData(' Certificate C', "4-4-2023",),
// CPDData(' Certificate D', "4-4-2023",),
// CPDData(' Certificate E', "4-4-2023",),
];
