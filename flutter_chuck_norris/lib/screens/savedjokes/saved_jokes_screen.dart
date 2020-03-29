import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchucknorris/db/models/joke.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutterchucknorris/screens/joke/bloc/joke_states.dart';
import 'package:flutterchucknorris/screens/joke/joke_screen_widgets.dart';
import 'package:flutterchucknorris/screens/savedjokes/bloc/saved_jokes_bloc.dart';
import 'package:flutterchucknorris/screens/savedjokes/bloc/saved_jokes_states.dart';

class SavedJokesScreen extends StatelessWidget {
  static const routeName = '/saved_jokes';
  final JokeRepository _jokeRepository;

  SavedJokesScreen(this._jokeRepository);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedJokesBloc>(
      create: (context) => SavedJokesBloc(_jokeRepository),
      child: SavedJokeScreenContent(),
    );
  }
}

class SavedJokeScreenContent extends StatelessWidget {
  const SavedJokeScreenContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Saved Jokes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: BlocBuilder<SavedJokesBloc, SavedJokesStates>(
          builder: (BuildContext context, state) {
            switch(state.runtimeType){
              case SavedJokesLoadingState:
                return CircularProgressIndicator();
              case SavedJokesLoadedState:
                return JokesList((state as SavedJokesLoadedState).jokes);
              default: return Text("Error loading jokes");
            }
          }
        ),
      ),
    );
  }
}

class JokesList extends StatelessWidget {
  final List<Joke> _jokes;
  JokesList(this._jokes);

  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        body: new ListView.builder
          (
            itemCount: _jokes.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 10, bottom: 2, right: 10, top: 2),
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text( _jokes[index].value),
                    isThreeLine: false,
                  ),
                ),
              );
            }
        ),
    );
  }
}

