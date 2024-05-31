import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counterValue;
  final int conterTotall;
  final int sumValue;

  const CounterState({this.counterValue = 1, this.conterTotall = 100, this.sumValue= 9999});

  CounterState copyWith({int? counterValue, int? conterTotall,  int? sumValue}) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
      conterTotall: conterTotall ?? this.conterTotall,
      sumValue: sumValue ?? this.sumValue,
    );
  }

  @override
  List<Object> get props => [counterValue, conterTotall, sumValue];
}
