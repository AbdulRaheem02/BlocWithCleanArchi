abstract class CounterRepository {
  int getCounter();
  void increment();
  void decrement();
}

class CounterRepositoryImpl implements CounterRepository {
  int _counter = 0;
  @override
  void decrement() {
    _counter--;
    // TODO: implement decrement
  }

  @override
  int getCounter() => _counter;

  @override
  void increment() {
    _counter++;
    // TODO: implement increment
  }
}
