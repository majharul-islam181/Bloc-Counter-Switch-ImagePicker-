import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isSwitch;

  double isSlide;

  SwitchState({this.isSwitch = false, this.isSlide = 0.1});

  SwitchState copyWith({bool? isSwitch01, double? isSlide01}) {
    return SwitchState(isSwitch: isSwitch01 ?? isSwitch,
    isSlide: isSlide01 ?? isSlide);

  }

  @override
  List<Object?> get props => [isSwitch, isSlide];
}
