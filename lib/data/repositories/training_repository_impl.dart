
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/training_repository.dart';
import '../data_source/remote/training_remote_data_source.dart';
import '../models/training/training_model.dart';

class TrainingFormatRepositoryImpl implements TrainingFormatRepository {
  final TrainingFormatRemoteDataSource remoteDataSource;
 
 
  final NetworkInfo networkInfo;

  TrainingFormatRepositoryImpl({
    required this.remoteDataSource,
   
  
    required this.networkInfo,
  });

 

  @override
  Future<Either<Failure, List<TrainingFormatModel>>> getTrainingFormat() async {
    if (await networkInfo.isConnected) {
    
       
          final remoteProduct = await remoteDataSource.getTrainingFormat();
          
        
          return Right(remoteProduct);
       
     
    } else {
      return Left(NetworkFailure(errorMessage: "network error"));
    }
  }

  
 

 
}
