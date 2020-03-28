import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutterchucknorris/screens/joke/bloc/joke_states.dart';
import 'package:flutterchucknorris/screens/joke/joke_screen_widgets.dart';
import 'package:flutterchucknorris/screens/savedjokes/bloc/saved_jokes_bloc.dart';

class SavedJokesScreen extends StatelessWidget {
  static const routeName = '/saved_jokes';
  final JokeRepository _jokeRepository;

  SavedJokesScreen(this._jokeRepository);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedJokesBloc>(
      create: (context) => SavedJokesBloc(_jokeRepository),
      child: JokeScreenContent(),
    );
  }
}

class JokeScreenContent extends StatelessWidget {
  const JokeScreenContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Chuck Jokes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(

      ),
    );
  }
}

