import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../entities/user/user.dart';
import '../../repositories/user_repository.dart';
import 'usecase.dart';

class UpdateProfileImageUseCase implements UseCase<User, UpdateProfileImageParams> {
  final UserRepository repository;
  UpdateProfileImageUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateProfileImageParams params) async {
    return await repository.updateProfileImage(params);
  }
}

class UpdateProfileImageParams {

   final File image;

  const UpdateProfileImageParams({
  
    required this.image,
 
  });
}
