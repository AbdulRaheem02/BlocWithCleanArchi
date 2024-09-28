import 'package:blocwithcleanarchitecture/features/counterApp/data/repository/counter_repo.dart';

class DecrementCounter {
  final CounterRepository repository;
  DecrementCounter(this.repository);

  void call() {
    repository.decrement();
  }
}
