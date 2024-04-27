import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/user/usecase.dart';
import '../data_source/local/user_local_data_source.dart';
import '../data_source/remote/user_remote_data_source.dart';
import '../models/user/authentication_response_model.dart';

typedef _DataSourceChooser = Future<AuthenticationResponseModel> Function();

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> signIn(params) async {
    return await _authenticate(() {
      return remoteDataSource.signIn(params);
    });
  }

  @override
  Future<Either<Failure, User>> signUp(params) async {
    return await _authenticate(() {
      return remoteDataSource.signUp(params);
    });
  }
  @override
  Future<Either<Failure, User>> updateProfile(params) async {
    
      final String token = await localDataSource.getToken();
    return await _authenticate(() {
      return remoteDataSource.updateProfile(params,token);
    });
  }
  @override
  Future<Either<Failure, User>> updateProfileImage(params) async {
    
      final String token = await localDataSource.getToken();
    return await _authenticate(() {
      return remoteDataSource.updateProfileImage(params,token);
    });
  }
  @override
  Future<Either<Failure, User>> getCachedUser() async {
    try {
      final user = await localDataSource.getUser();
      return Right(user);
    } on CredentialFailure catch (failure) {
      return Left(CacheFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, NoParams>> signOut() async {
    try {
      await localDataSource.clearCache();
      return Right(NoParams());
    } on CredentialFailure catch (failure) {
      return Left(CacheFailure(errorMessage: failure.errorMessage));
    }
  }

  Future<Either<Failure, User>> _authenticate(
      _DataSourceChooser getDataSource,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        localDataSource.saveToken(remoteResponse.token);
        localDataSource.saveUser(remoteResponse.user);
        return Right(remoteResponse.user);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure(errorMessage: "Network fail"));
    }
  }

}
