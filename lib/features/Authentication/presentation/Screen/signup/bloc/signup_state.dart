part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignUpLoading extends SignupState {}

final class SignUpSucess extends SignupState {}

final class SignUpFailure extends SignupState {
  final String message;

  const SignUpFailure({required this.message});
}
