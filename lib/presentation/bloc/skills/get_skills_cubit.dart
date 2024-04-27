
import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/usecases/skills/get_skills_usecase.dart';
import '../../../domain/usecases/user/usecase.dart';
import 'dart:developer' as developer;
part 'get_skills_state.dart';

class SkillsFetchCubit extends Cubit<SkillsFetchState> {
  final GetSkillsUseCase _getSkillsUseCase;

  SkillsFetchCubit(this._getSkillsUseCase)
      : super( SkillsFetchInitial());

  void getSkills() async {
    try {
      emit(SkillsFetchLoading());
     
      final remoteResult = await _getSkillsUseCase(NoParams());
     developer.log('remote${remoteResult.toString()}');
      remoteResult.fold(
        (failure) => emit(SkillsFetchFail()),
        (skills) => emit(SkillsFetchSuccess(skills)),
      );
    } catch (e) {
      emit(SkillsFetchFail());
    }
  }

  
}
