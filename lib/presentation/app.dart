import 'package:apex_cpd/presentation/bloc/skills/get_skills_cubit.dart';
import 'package:apex_cpd/presentation/bloc/training/get_training_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../core/services/services_locator.dart' as di;

import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';
import 'bloc/cpd/add_cpd/add_cpd_cubit.dart';
import 'bloc/cpd/get_cpd/get_cpd_cubit.dart';
import 'bloc/user/user_bloc.dart';
class App extends StatelessWidget {
  const App({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          
          BlocProvider(
            create: (context) => di.sl<UserBloc>()..add(CheckUser()),
          ),
          
        BlocProvider(
          create: (context) => di.sl<CpdFetchCubit>()..getCpd(),
        ),
         BlocProvider(
          create: (context) => di.sl<SkillsFetchCubit>()..getSkills(),
        ),
 BlocProvider(
          create: (context) => di.sl<TrainMethodFetchCubit>()..getTraininMethod(),
        ),
        ],
        child:
    MaterialApp.router(
      
      theme:AppTheme.lightTheme ,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
      builder: EasyLoading.init(),

    ));
  }
}
