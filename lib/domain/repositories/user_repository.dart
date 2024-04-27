import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user/user.dart';
import '../usecases/user/sign_in_usecase.dart';
import '../usecases/user/sign_up_usecase.dart';
import '../usecases/user/update_profile_image_user_usecase.dart';
import '../usecases/user/update_profile_user_usecase.dart';
import '../usecases/user/usecase.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> signIn(SignInParams params);
  Future<Either<Failure, User>> signUp(SignUpParams params);
    Future<Either<Failure, User>> updateProfile(UpdateProfileParams params);
        Future<Either<Failure, User>> updateProfileImage(UpdateProfileImageParams params);
  Future<Either<Failure, NoParams>> signOut();
  Future<Either<Failure, User>> getCachedUser();
}
