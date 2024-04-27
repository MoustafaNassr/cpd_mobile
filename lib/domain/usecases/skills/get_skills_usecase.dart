import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/user/user.dart';
import '../../repositories/cpd_repository.dart';
import '../../repositories/skills_repository.dart';
import '../../repositories/user_repository.dart';
import '../user/usecase.dart';
import 'dart:developer'as developer;

class GetSkillsUseCase implements UseCase< List<SkillsModel>, NoParams> {
  final SkillsRepository repository;
  GetSkillsUseCase(this.repository);

  @override
   Future<Either<Failure, List<SkillsModel>>> call(NoParams params) async {
    return await repository.getSkills();
    
  }
}

