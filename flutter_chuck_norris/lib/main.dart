import 'package:flutter/material.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutterchucknorris/screens/joke/joke_screen.dart';
import 'package:flutterchucknorris/screens/savedjokes/saved_jokes_screen.dart';

void main() {
  JokeRepository _repository = JokeRepository();
  runApp(MyApp(_repository));
}

class MyApp extends StatelessWidget {
  final JokeRepository _jokeRepository;

  MyApp(this._jokeRepository);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: JokeScreen.routeName,
      routes: {
        JokeScreen.routeName: (context) => JokeScreen(_jokeRepository),
        SavedJokesScreen.routeName: (context) => SavedJokesScreen(),
      },
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      home: JokeScreen(_jokeRepository),
    );
  }
}
