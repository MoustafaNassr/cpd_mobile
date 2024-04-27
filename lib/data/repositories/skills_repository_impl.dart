import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/cpd_repository.dart';
import '../../domain/repositories/skills_repository.dart';
import '../data_source/local/user_local_data_source.dart';
import '../data_source/remote/cpd_remote_data_soure.dart';
import '../data_source/remote/skills_remote_data_source.dart';
import 'dart:developer' as developer;
class SkillsRepositoryImpl implements SkillsRepository {
  final SkillsRemoteDataSource remoteDataSource;
 
 
  final NetworkInfo networkInfo;

  SkillsRepositoryImpl({
    required this.remoteDataSource,
   
  
    required this.networkInfo,
  });

 

  @override
  Future<Either<Failure, List<SkillsModel>>> getSkills() async {
    if (await networkInfo.isConnected) {
    
       
          final remoteSkills= await remoteDataSource.getSkills();
          
        developer.log(remoteSkills.toString());
          return Right(remoteSkills);
       
     
    } else {
      return Left(NetworkFailure(errorMessage: "network error"));
    }
  }

  
 

 
}
