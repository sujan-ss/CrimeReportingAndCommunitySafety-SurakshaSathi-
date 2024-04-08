import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:suraksha_saathi/features/Authentication/data/reposotery/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<FormSubmitEvent>(formSubmitEvent);
  }
  final AuthRepository authRepository = AuthRepository();

  FutureOr<void> formSubmitEvent(
      FormSubmitEvent event, Emitter<SignupState> emit) async {
    emit(SignUpLoading());
    final response = await authRepository.signUp(
        number: event.number,
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
        imageUrl: event.imageUrl,
        passportImageUrl: event.passportImageUrl);
    response.fold((l) {
      emit(SignUpSucess());
    }, (r) {
      emit(SignUpFailure(message: r));
    });
  }
}
