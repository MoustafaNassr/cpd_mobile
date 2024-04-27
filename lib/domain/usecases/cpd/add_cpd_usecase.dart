import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/user/user.dart';
import '../../repositories/cpd_repository.dart';
import '../../repositories/user_repository.dart';
import '../user/usecase.dart';


class AddCpdUseCase implements UseCase<CPDData, AddCpdDataModelParams> {
  final CpdRepository repository;
  AddCpdUseCase(this.repository);

  @override
  Future<Either<Failure, CpdDataModel>> call(AddCpdDataModelParams params) async {
    return await repository.addCpd(params);
  }
}
class AddCpdDataModelParams {
  const AddCpdDataModelParams({
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
   final   int  skills_area;
   final   int  format_of_training;
  final int hours_logged;
  final String date_completed;
  final int cost_of_cpd;
  final String what_did_you_learn;
  final String future_dev_nots;
  final String file;
}

