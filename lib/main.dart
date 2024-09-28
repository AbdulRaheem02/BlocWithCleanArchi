import 'package:blocwithcleanarchitecture/features/counterApp/data/repository/counter_repo.dart';
import 'package:blocwithcleanarchitecture/features/counterApp/domain/usecases/incrementCounter.dart';
import 'package:blocwithcleanarchitecture/features/counterApp/presentation/bloc/counter_bloc.dart';
import 'package:blocwithcleanarchitecture/features/counterApp/presentation/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/counterApp/domain/usecases/decrementCounter.dart';

Future<void> main() async {
  final repository = CounterRepositoryImpl();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    repository: repository,
  ));
}

class MyApp extends StatelessWidget {
  final CounterRepositoryImpl repository;

  const MyApp({required this.repository, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => CounterBloc(
              incrementCounter: IncrementCounter(repository),
              decrementCounter: DecrementCounter(repository)),
          child: const CounterPage()),
    );
  }
}
