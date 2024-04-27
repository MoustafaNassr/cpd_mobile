import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../data/models/training/training_model.dart';
import '../../entities/user/user.dart';
import '../../repositories/cpd_repository.dart';
import '../../repositories/skills_repository.dart';
import '../../repositories/training_repository.dart';
import '../../repositories/user_repository.dart';
import '../user/usecase.dart';


class GetTrainMethodUseCase implements UseCase< List<TrainingFormatModel>, NoParams> {
  final TrainingFormatRepository repository;
  GetTrainMethodUseCase(this.repository);

  @override
   Future<Either<Failure, List<TrainingFormatModel>>> call(NoParams params) async {
    return await repository.getTrainingFormat();
  }
}

