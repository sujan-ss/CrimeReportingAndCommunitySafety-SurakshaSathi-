part of 'attachfiles_bloc.dart';

sealed class AttachfilesState extends Equatable {
  const AttachfilesState();

  @override
  List<Object> get props => [];
}

final class AttachfilesInitial extends AttachfilesState {}

final class AttachfilesLoading extends AttachfilesState {}

final class AttachFileSuccess extends AttachfilesState {}

final class AttachFileFailure extends AttachfilesState {
  final String message;

  const AttachFileFailure(this.message);

  @override
  List<Object> get props => [message];
}
