import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/domain/usecases/cpd/add_cpd_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
abstract class CpdRepository {
  Future<Either<Failure, CpdDataModel>> addCpd(AddCpdDataModelParams params);
  Future<Either<Failure, List<CpdDataModel>>> getCpd();

}