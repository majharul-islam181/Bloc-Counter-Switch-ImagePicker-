import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableAndDisableNotification extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double value;
  SliderEvent({required this.value});

  @override
  List<Object> get props => [
    value
  ];
}
