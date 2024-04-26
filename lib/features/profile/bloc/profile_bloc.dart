import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suraksha_saathi/data/model/user_model.dart';
import 'package:suraksha_saathi/data/reposotory/access_tooken_reposotory.dart';
import 'package:suraksha_saathi/features/profile/data/repository/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetUserEvent>(getUser);
    on<LogoutEvent>(logoutevent);
  }

  final userRepo = UserRepo();

  FutureOr<void> getUser(GetUserEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final response = await UserRepo().getUser();

    response.fold((l) {
      emit(ProfileLoaded(l));
    }, (r) {
      emit(ProfileError(r));
    });
  }

  FutureOr<void> logoutevent(
      LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    await AccessTokenRepo().removeAccessToken();
    emit(LogoutSuccess());
  }
}
