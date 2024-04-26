part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();

  final bool verified;
  LoginSuccess({required this.verified});
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TogglePasswordVisibilityState extends LoginState {
  final bool isVisible;

  TogglePasswordVisibilityState({required this.isVisible});

  @override
  List<Object?> get props => throw UnimplementedError();
}
