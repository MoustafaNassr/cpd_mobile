
import 'package:apex_cpd/data/models/training/training_model.dart';
import 'package:apex_cpd/domain/entities/training/training.dart';
import 'package:apex_cpd/domain/usecases/training/get_train_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/usecases/user/usecase.dart';
import 'dart:developer' as developer;
part 'get_training_state.dart';

class TrainMethodFetchCubit extends Cubit<TrainMethodFetchState> {
  final GetTrainMethodUseCase _getTrainMethodUseCase;

  TrainMethodFetchCubit(this._getTrainMethodUseCase)
      : super( TrainMethodFetchInitial());

  void getTraininMethod() async {
    try {
      emit(TrainMethodFetchLoading());
     
      final remoteResult = await _getTrainMethodUseCase(NoParams());
        developer.log('remote${remoteResult.toString()}');
      remoteResult.fold(
        (failure) => emit(TrainMethodFetchFail()),
        (train) => emit(TrainMethodFetchSuccess(train)),
      );
    } catch (e) {
      emit(TrainMethodFetchFail());
    }
  }

  
}
