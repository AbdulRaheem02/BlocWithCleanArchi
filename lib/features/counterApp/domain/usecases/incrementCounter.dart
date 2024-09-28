import 'package:blocwithcleanarchitecture/features/counterApp/data/repository/counter_repo.dart';

class IncrementCounter {
  final CounterRepository repository;
  IncrementCounter(this.repository);

  void call() {
    repository.increment();
  }
}
