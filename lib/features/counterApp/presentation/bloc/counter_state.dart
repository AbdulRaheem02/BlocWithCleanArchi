abstract class CounterState {}

class CounterInitial extends CounterState {
  final int counter;
  CounterInitial(this.counter);
}

class CounterValue extends CounterState {
  final int counter;
  CounterValue(this.counter);
}
