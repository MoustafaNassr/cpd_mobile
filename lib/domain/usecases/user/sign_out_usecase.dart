import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/user_repository.dart';
import 'usecase.dart';

class SignOutUseCase implements UseCase<NoParams, NoParams> {
  final UserRepository repository;
  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.signOut();
  }
}
