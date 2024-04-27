import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/user/user.dart';
import '../../repositories/user_repository.dart';
import 'usecase.dart';

class UpdateProfileUseCase implements UseCase<User, UpdateProfileParams> {
  final UserRepository repository;
  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(params);
  }
}

class UpdateProfileParams {
  // final String firstName;
  // final String lastName;
   final String professionTitle;
  final String email;
 // final String password;
  const UpdateProfileParams({
    // required this.firstName,
    // required this.lastName,
    required this.email,
    required this.professionTitle,
 //   required this.password,
  });
}
