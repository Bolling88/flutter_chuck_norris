import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchucknorris/bloc/joke_bloc.dart';
import 'package:flutterchucknorris/bloc/joke_view_states.dart';

class JokeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<JokeBloc>(context),
      builder: (BuildContext context, state) {
        if (state is JokeUninitializedState) {
          return JokeTextWidget(jokeText: "Unintialised State");
        } else if (state is JokeEmptyState) {
          return JokeTextWidget(jokeText: "No jokes found");
        } else if (state is JokeErrorState) {
          return JokeTextWidget(jokeText: "Something went wrong...");
        } else if (state is JokeFetchingState) {
          return Container(child: Center(child: CircularProgressIndicator()));
        } else {
          final jokeFetchedState = state as JokeFetchedState;
          final joke = jokeFetchedState.joke;
          return JokeTextWidget(jokeText: joke.value);
        }
      },
    );
  }
}

class JokeTextWidget extends StatelessWidget {
  final String jokeText;

  JokeTextWidget({this.jokeText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        jokeText,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

}
