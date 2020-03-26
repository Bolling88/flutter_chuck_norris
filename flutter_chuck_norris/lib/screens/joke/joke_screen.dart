import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutterchucknorris/screens/joke/bloc/joke_screen_states.dart';
import 'package:flutterchucknorris/screens/joke/joke_screen_widgets.dart';

import 'bloc/joke_bloc.dart';
import 'bloc/joke_screen_events.dart';

class JokeScreen extends StatelessWidget {
  final JokeRepository jokeRepository;

  JokeScreen({this.jokeRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokeBloc>(
      create: (context) => JokeBloc(jokeRepository: jokeRepository),
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
    // ignore: close_sinks, since screens.joke.bloc provider handles this automatically
    final JokeBloc jokeBloc = BlocProvider.of<JokeBloc>(context);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            JokeWidget(),
            SaveJokeWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.refresh),
        label: Text("New Joke"),
        onPressed: () {
          jokeBloc.add(ClickedNewJokeEvent());
        },
      ),
    );
  }
}

