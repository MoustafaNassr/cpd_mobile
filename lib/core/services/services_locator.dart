
import 'package:apex_cpd/domain/usecases/skills/get_skills_usecase.dart';
import 'package:apex_cpd/domain/usecases/training/get_train_usecase.dart';
import 'package:apex_cpd/presentation/bloc/skills/get_skills_cubit.dart';
import 'package:apex_cpd/presentation/bloc/training/get_training_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_source/local/user_local_data_source.dart';
import '../../data/data_source/remote/cpd_remote_data_soure.dart';
import '../../data/data_source/remote/skills_remote_data_source.dart';
import '../../data/data_source/remote/training_remote_data_source.dart';
import '../../data/data_source/remote/user_remote_data_source.dart';
import '../../data/repositories/cpd_repository_impl.dart';
import '../../data/repositories/skills_repository_impl.dart';
import '../../data/repositories/training_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';

import '../../domain/repositories/cpd_repository.dart';
import '../../domain/repositories/skills_repository.dart';
import '../../domain/repositories/training_repository.dart';
import '../../domain/repositories/user_repository.dart';

import '../../domain/usecases/cpd/add_cpd_usecase.dart';
import '../../domain/usecases/cpd/get_cpd_usecase.dart';
import '../../domain/usecases/user/get_cached_user_usecase.dart';
import '../../domain/usecases/user/sign_in_usecase.dart';
import '../../domain/usecases/user/sign_out_usecase.dart';
import '../../domain/usecases/user/sign_up_usecase.dart';
import '../../domain/usecases/user/update_profile_image_user_usecase.dart';
import '../../domain/usecases/user/update_profile_user_usecase.dart';
import '../../presentation/bloc/cpd/add_cpd/add_cpd_cubit.dart';
import '../../presentation/bloc/cpd/get_cpd/get_cpd_cubit.dart';
import '../../presentation/bloc/user/user_bloc.dart';
import '../constant/colors.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
 //Features - 
  // Bloc cpd
  sl.registerFactory(
    () => CpdAddCubit(sl()),
  );
  sl.registerFactory(
    () => CpdFetchCubit(sl(), ),
  );
  // Use cases
  sl.registerLazySingleton(() => AddCpdUseCase(sl()));
 sl.registerLazySingleton(() => GetCpdUseCase(sl()));
  // Repository
  sl.registerLazySingleton<CpdRepository>(
    () => CpdRepositoryImpl(
      remoteDataSource: sl(),
     
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<CpdRemoteDataSource>(
    () => CpdRemoteDataSourceSourceImpl(client: sl()),
  );

  //bloc skills
 
  
  sl.registerFactory(
    () => SkillsFetchCubit(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSkillsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<SkillsRepository>(
    () => SkillsRepositoryImpl(
      remoteDataSource: sl(),
     
      networkInfo: sl(),
     
    ),
  );
  // Data sources
  sl.registerLazySingleton<SkillsRemoteDataSource>(
    () => SkillsRemoteDataSourceSourceImpl(client: sl()),
  );


//bloc Train method
 
  
  sl.registerFactory(
    () => TrainMethodFetchCubit(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetTrainMethodUseCase(sl()));

  // Repository
  sl.registerLazySingleton<TrainingFormatRepository>(
    () => TrainingFormatRepositoryImpl(
      remoteDataSource: sl(),
     
      networkInfo: sl(),
     
    ),
  );
  // Data sources
  sl.registerLazySingleton<TrainingFormatRemoteDataSource>(
    () => TrainingFormatRemoteDataSourceSourceImpl(client: sl()),
  );

  // Bloc user
  sl.registerFactory(
    () => UserBloc(sl(), sl(), sl(), sl(),sl(),sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileImageUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );

  ///***********************************************
  ///! Core
  /// sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///! External
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
