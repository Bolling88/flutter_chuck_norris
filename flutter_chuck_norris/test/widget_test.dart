// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterchucknorris/api/joke_api.dart';
import 'package:flutterchucknorris/db/app_database.dart';

import 'package:flutterchucknorris/main.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';

void main() async {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final JokeApi _jokeApi = JokeApi();
    final JokeRepository repository = JokeRepository(_jokeApi);
    await tester.pumpWidget(MyApp(repository));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
