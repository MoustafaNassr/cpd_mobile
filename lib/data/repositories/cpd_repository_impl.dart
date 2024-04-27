import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:apex_cpd/domain/usecases/cpd/add_cpd_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/cpd_repository.dart';
import '../data_source/local/user_local_data_source.dart';
import '../data_source/remote/cpd_remote_data_soure.dart';

class CpdRepositoryImpl implements CpdRepository {
  final CpdRemoteDataSource remoteDataSource;
 
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;

  CpdRepositoryImpl({
    required this.remoteDataSource,
   
    required this.userLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CpdDataModel>> addCpd(AddCpdDataModelParams params) async {
    if (await userLocalDataSource.isTokenAvailable()) {
      final String token = await userLocalDataSource.getToken();
      final remoteProduct = await remoteDataSource.addCpd(
        params, //  CpdDataModel.fromJson(params),
        token,
      );
      return Right(remoteProduct);
    } else {
      return Left(NetworkFailure(errorMessage: "network error"));
    }
  }

  @override
  Future<Either<Failure, List<CpdDataModel>>> getCpd() async {
    if (await networkInfo.isConnected) {
      if (await userLocalDataSource.isTokenAvailable()) {
        try {
          final String token = await userLocalDataSource.getToken();
          final remoteProduct = await remoteDataSource.getCpds(
            token,
          );
        
          return Right(remoteProduct);
        } on Failure catch (failure) {
          return Left(failure);
        }
      } else {
        return Left(AuthenticationFailure(errorMessage: "error auth"));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "network error"));
    }
  }

  
 

 
}
