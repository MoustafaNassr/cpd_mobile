import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/user/user.dart';
import '../../repositories/cpd_repository.dart';
import '../../repositories/user_repository.dart';
import '../user/usecase.dart';


class GetCpdUseCase implements UseCase< List<CpdDataModel>, NoParams> {
  final CpdRepository repository;
  GetCpdUseCase(this.repository);

  @override
   Future<Either<Failure, List<CpdDataModel>>> call(NoParams params) async {
    return await repository.getCpd();
  }
}

