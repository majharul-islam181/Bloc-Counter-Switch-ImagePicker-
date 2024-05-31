import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class FromCamera extends ImagePickerEvent {}

class FromGallery extends ImagePickerEvent {}
