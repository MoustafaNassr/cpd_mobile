
import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
abstract class SkillsRepository {
  Future<Either<Failure, List<SkillsModel>>> getSkills();

}