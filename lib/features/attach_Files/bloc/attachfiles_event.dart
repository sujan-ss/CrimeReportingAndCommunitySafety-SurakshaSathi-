part of 'attachfiles_bloc.dart';

sealed class AttachfilesEvent extends Equatable {
  const AttachfilesEvent();

  @override
  List<Object> get props => [];
}

class AddAttachFiles extends AttachfilesEvent {
  final String photoUrl;
  final String audioUrl;
  final String videoUrl;
  final String description;

  const AddAttachFiles({
    required this.photoUrl,
    required this.audioUrl,
    required this.videoUrl,
    required this.description,
  });

  @override
  List<Object> get props => [photoUrl, audioUrl, videoUrl, description];
}
