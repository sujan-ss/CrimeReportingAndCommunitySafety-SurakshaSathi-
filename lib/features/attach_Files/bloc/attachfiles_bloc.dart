import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suraksha_saathi/features/attach_Files/data/repository/attach_media_service.dart';

part 'attachfiles_event.dart';
part 'attachfiles_state.dart';

class AttachfilesBloc extends Bloc<AttachfilesEvent, AttachfilesState> {
  AttachfilesBloc() : super(AttachfilesInitial()) {
    on<AddAttachFiles>(addAttachFiles);
  }

  FutureOr<void> addAttachFiles(
      AddAttachFiles event, Emitter<AttachfilesState> emit) async {
    emit(AttachfilesLoading());
    final response = await AttachMedaiService().addData(
        photoUrl: event.photoUrl,
        audioUrl: event.audioUrl,
        videoUrl: event.videoUrl,
        description: event.description);
    response.fold(
        (l) => emit(AttachFileSuccess()), (r) => emit(AttachFileFailure(r)));
  }
}
