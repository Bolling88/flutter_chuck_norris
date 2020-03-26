import 'package:flutter/material.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutterchucknorris/screens/joke/joke_screen.dart';

void main(){
  JokeRepository _repository = JokeRepository();
  runApp(MyApp(jokeRepository:_repository));
}

class MyApp extends StatelessWidget {
  final JokeRepository jokeRepository;
  MyApp({this.jokeRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: JokeScreen(jokeRepository: jokeRepository),
    );
  }
}

