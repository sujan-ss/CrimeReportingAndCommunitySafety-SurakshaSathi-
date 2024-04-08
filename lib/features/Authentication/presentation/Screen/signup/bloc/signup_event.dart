part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class FormSubmitEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String imageUrl;
  final String passportImageUrl;
  final String number;

  const FormSubmitEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.imageUrl,
      required this.number,
      required this.passportImageUrl});
}
