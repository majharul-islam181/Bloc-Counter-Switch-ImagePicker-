import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/image_picker/image_picker_event.dart';
import 'package:flutter_bloc_practise/bloc/image_picker/image_picker_state.dart';
import 'package:flutter_bloc_practise/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc({required this.imagePickerUtils})
      : super(ImagePickerState()) {
    on<FromCamera>(_fromCamera);
    on<FromGallery>(_fromGallery);
  }

  void _fromCamera(FromCamera event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();

    emit(state.copyWith(file: file));
  }

  void _fromGallery(FromGallery event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.gallerySelect();
    emit(state.copyWith(file: file));
  }
}
