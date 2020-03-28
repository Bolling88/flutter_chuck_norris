import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutterchucknorris/screens/joke/bloc/joke_screen_states.dart';
import 'package:flutterchucknorris/screens/joke/joke_screen_widgets.dart';
import 'package:flutterchucknorris/screens/savedjokes/saved_jokes_screen.dart';

import 'bloc/joke_bloc.dart';
import 'bloc/joke_screen_events.dart';

class JokeScreen extends StatelessWidget {
  //used for navigating to this route
  static const routeName = '/main';

  //constructor and properties
  final JokeRepository _jokeRepository;

  JokeScreen(this._jokeRepository);

  @override
  Widget build(BuildContext context) {
    //Constructing this screens bloc
    return BlocProvider<JokeBloc>(
      create: (context) => JokeBloc(_jokeRepository),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
                Navigator.pushNamed(context, SavedJokesScreen.routeName);
            },
          )
        ],
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
          BlocProvider.of<JokeBloc>(context).add(JokeEventRefresh());
        },
      ),
    );
  }
}
