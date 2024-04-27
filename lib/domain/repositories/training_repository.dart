
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/training/training_model.dart';
abstract class TrainingFormatRepository {
  Future<Either<Failure, List<TrainingFormatModel>>> getTrainingFormat();

}