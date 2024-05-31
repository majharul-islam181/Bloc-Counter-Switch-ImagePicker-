import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_practise/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableAndDisableNotification>(_enabledisable);
    on<SliderEvent>(_slideEvent);
  }

  void _enabledisable(
      EnableAndDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch01: !state.isSwitch));
  }

  void _slideEvent(SliderEvent events, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSlide01: events.value));
  }
}
