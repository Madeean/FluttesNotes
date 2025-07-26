// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter_demo/screens/testing/TestingScreen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockPref extends Mock implements SharedPreferences {}

void main() {
  group('Test Counter', () {
    late SharedPreferences pref;
    late Counter counter;
    setUp(() {
      pref = MockPref();
      counter = Counter(pref);
      when(
        () => pref.setInt(any(), any()),
      ).thenAnswer((_) async => Future(() => true));
    });

    test('Test increment', () {
      counter.increment();
      expect(counter.state, 1);
    });

    test('Test decrement', () {
      counter.decrement();
      expect(counter.state, -1);
    });

    test('Test save', () {
      counter.increment();
      counter.save();
      verify(() => pref.setInt('counter', 1)).called(1);
    });

    test('Test load', () {
      when(() => pref.getInt(any())).thenReturn(3);
      counter.load();
      expect(counter.state, 3);
    });
  });
}
