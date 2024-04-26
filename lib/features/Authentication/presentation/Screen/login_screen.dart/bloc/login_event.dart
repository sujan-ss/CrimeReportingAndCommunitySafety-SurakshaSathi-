part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class FormSubmitEvent extends LoginEvent {
  final String email;
  final String password;

  FormSubmitEvent({
    required this.email,
    required this.password,
  });
}

class TogglePasswordVisibility extends LoginEvent {
  final bool isVisible;

  TogglePasswordVisibility({required this.isVisible});
}
