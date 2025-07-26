import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterCubit extends Cubit<int> {
  SharedPreferences _prefs;

  CounterCubit(this._prefs) : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  Future<void> save() async {
    await _prefs.setInt('counter', state);
  }

  Future<void> load() async {
    final counter = _prefs.getInt('counter') ?? 0;
    emit(counter);
  }
}

class Counter {
  int state = 0;
  SharedPreferences _prefs;

  Counter(this._prefs);

  void increment() => state++;

  void decrement() => state--;

  Future<void> save() async {
    await _prefs.setInt('counter', state);
  }

  Future<void> load() async {
    final counter = _prefs.getInt('counter') ?? 0;
    state = counter;
  }
}

class Testingscreen extends StatelessWidget {
  static const String route = 'TestingScreen';

  const Testingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CounterCubit>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('$state');
              },
            ),
            SizedBox(height: 32),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    cubit.increment();
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    cubit.decrement();
                  },
                  icon: Icon(Icons.read_more),
                ),
                IconButton(
                  onPressed: () {
                    cubit.save();
                  },
                  icon: Icon(Icons.save),
                ),
                IconButton(
                  onPressed: () {
                    cubit.load();
                  },
                  icon: Icon(Icons.upload),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
