part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends ProfileEvent {
  const GetUserEvent();
}

class LogoutEvent extends ProfileEvent {
  const LogoutEvent();
}
