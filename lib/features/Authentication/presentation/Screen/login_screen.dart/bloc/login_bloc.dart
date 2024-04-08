import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:suraksha_saathi/features/Authentication/data/reposotery/auth_repository.dart';
import 'package:suraksha_saathi/reposotory/access_tooken_reposotory.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<FormSubmitEvent>(formsubmitevent);
    on<TogglePasswordVisibility>(togglePasswordVisibiliy);
  }

  FutureOr<void> formsubmitevent(
      FormSubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final response = await AuthRepository()
        .login(email: event.email, password: event.password);
    response.fold((l) {
      AccessTokenRepo.saveAccessToken(l);
      emit(LoginSuccess());
    }, (r) {
      emit(LoginFailure(message: r));
    });
  }

  FutureOr<void> togglePasswordVisibiliy(
      TogglePasswordVisibility event, Emitter<LoginState> emit) {
    emit(TogglePasswordVisibilityState(isVisible: event.isVisible));
  }
}
