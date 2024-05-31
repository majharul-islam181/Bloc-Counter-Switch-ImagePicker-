import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practise/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_practise/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<Sumbutton>(_sum);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterValue: state.counterValue + 10));
    emit(state.copyWith(conterTotall: state.counterValue + 10));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counterValue: state.counterValue - 1));
    emit(state.copyWith(conterTotall: state.counterValue - 10));
  }

  void _sum(Sumbutton event, Emitter<CounterState> emit) {
    emit(state.copyWith(sumValue: (state.conterTotall + state.counterValue)));
  }
  
}
