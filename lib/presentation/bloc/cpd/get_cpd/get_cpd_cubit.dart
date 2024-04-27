import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/usecases/cpd/get_cpd_usecase.dart';
import '../../../../domain/usecases/user/usecase.dart';

part 'get_cpd_state.dart';

class CpdFetchCubit extends Cubit<CpdFetchState> {
  final GetCpdUseCase _getCpdUseCase;

  CpdFetchCubit(this._getCpdUseCase)
      : super( CpdFetchInitial());

  void getCpd() async {
    try {
      emit(CpdFetchLoading());
     
      final remoteResult = await _getCpdUseCase(NoParams());
      remoteResult.fold(
        (failure) => emit(CpdFetchFail()),
        (cpd) => emit(CpdFetchSuccess(cpd)),
      );
    } catch (e) {
      emit(CpdFetchFail());
    }
  }

  
}
