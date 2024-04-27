import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failures.dart';
import '../../../domain/entities/user/user.dart';
import '../../../domain/usecases/user/get_cached_user_usecase.dart';
import '../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../domain/usecases/user/sign_out_usecase.dart';
import '../../../domain/usecases/user/sign_up_usecase.dart';
import '../../../domain/usecases/user/update_profile_image_user_usecase.dart';
import '../../../domain/usecases/user/update_profile_user_usecase.dart';
import '../../../domain/usecases/user/usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCachedUserUseCase _getCachedUserUseCase;
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final UpdateProfileUseCase  _updateProfileUseCase;
  final UpdateProfileImageUseCase  _updateProfileImageUseCase;
  UserBloc(
    this._signInUseCase,
    this._getCachedUserUseCase,
    this._signOutUseCase,
    this._signUpUseCase,
    this._updateProfileUseCase,
    this._updateProfileImageUseCase
  ) : super(UserInitial()) {
    on<SignInUser>(_onSignIn);
    on<SignUpUser>(_onSignUp);
     on<UpdateProfileUser>(_onUpdateProfile);
     on<UpdateProfileImageUser>(_onUpdateProfileImage);
    on<CheckUser>(_onCheckUser);
    on<SignOutUser>(_onSignOut);
  }

  void _onSignIn(SignInUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await _signInUseCase(event.params);
      result.fold(
        (failure) => emit(UserLoggedFail(failure)),
        (user) => emit(UserLogged(user)),
      );
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure(errorMessage: e.toString())));
    }
  }

  void _onCheckUser(CheckUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await _getCachedUserUseCase(NoParams());
      result.fold(
        (failure) => emit(UserLoggedFail(failure)),
        (user) => emit(UserLogged(user)),
      );
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure(errorMessage:  e.toString())));
    }
  }

  FutureOr<void> _onSignUp(SignUpUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await _signUpUseCase(event.params);
      result.fold(
        (failure) => emit(UserLoggedFail(failure)),
        (user) => emit(UserLogged(user)),
      );
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure(errorMessage:  e.toString())));
    }
  }
FutureOr<void> _onUpdateProfile(UpdateProfileUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await _updateProfileUseCase(event.params);
      result.fold(
        (failure) => emit(UserLoggedFail(failure)),
        (user) => emit(UserLogged(user)),
      );
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure(errorMessage:  e.toString())));
    }
  }
  FutureOr<void> _onUpdateProfileImage(UpdateProfileImageUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await _updateProfileImageUseCase(event.params);
      result.fold(
        (failure) => emit(UserLoggedFail(failure)),
        (user) => emit(UserLogged(user)),
      );
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure(errorMessage:  e.toString())));
    }
  }
  void _onSignOut(SignOutUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      await _signOutUseCase(NoParams());
      emit(UserLoggedOut());
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure(errorMessage:  e.toString())));
    }
  }
}
