import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CounterInitial) {
            print('State is in initial state');
            message = 'App is in Initial State';
            setState(() {});
          }
          if (state is CounterLoading) {
            print('State is in loading state');
            message = 'Loading';
            setState(() {});
          }
          if (state is CounterSuccess) {
            print('State is in success state');
            message = state.message;
            setState(() {});
          }

          if (state is CounterFailed) {
            print('State is in failure state');
            message = state.message;
            setState(() {});
          }

          /// Add as many as possible
        },
        child: Center(
          child: Text(
            message ?? '',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.add(TriggerNumberEvent()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
