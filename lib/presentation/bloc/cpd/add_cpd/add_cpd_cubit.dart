
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/models/cpd/cpd_model.dart';
import '../../../../domain/usecases/cpd/add_cpd_usecase.dart';

part 'add_cpd_state.dart';

class CpdAddCubit extends Cubit<CpdAddState> {
  final AddCpdUseCase _addCpdUseCase;
 CpdAddCubit(this._addCpdUseCase) : super(CpdAddInitial());

  void addCpd(AddCpdDataModelParams params) async {
    try {
      emit(CpdAddLoading());
      final result = await _addCpdUseCase(params);
      result.fold(
            (failure) => emit(CpdAddFail()),
            (cpd) => emit(CpdAddSuccess(cpd)),
      );
    } catch (e) {
      emit(CpdAddFail());
    }
  }
}
