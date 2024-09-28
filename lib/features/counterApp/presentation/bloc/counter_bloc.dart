import 'package:blocwithcleanarchitecture/features/counterApp/domain/usecases/incrementCounter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/decrementCounter.dart';
import 'counter_evnet.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;
  CounterBloc({required this.incrementCounter, required this.decrementCounter})
      : super(CounterValue(0)) {
    on<IncrementEvent>(((event, emit) {
      incrementCounter();
      emit(CounterValue(incrementCounter.repository.getCounter()));
    }));
    on<DecrementEvent>(((event, emit) {
      decrementCounter();
      emit(CounterValue(decrementCounter.repository.getCounter()));
    }));
  }
}
