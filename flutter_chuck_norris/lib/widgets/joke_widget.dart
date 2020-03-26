import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchucknorris/screens/joke/bloc/joke_bloc.dart';
import 'package:flutterchucknorris/screens/joke/bloc/joke_screen_states.dart';

class JokeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Keep the BlocBuilder as low as possible in the view hierarchy, since they
    //will redraw on state changed, and we don't want to redraw whole screens if just
    //a part of it changed
    return BlocBuilder<JokeBloc, JokeScreenState>(
      builder: (BuildContext context, state) {
        switch(state.runtimeType){
          case JokeUninitializedState:
            return JokeTextWidget(jokeText: "Unintialised State");
          case JokeEmptyState:
            return JokeTextWidget(jokeText: "No jokes found");
          case JokeErrorState:
            return JokeTextWidget(jokeText: "Something went wrong...");
          case JokeFetchingState:
            return Container(child: Center(child: CircularProgressIndicator()));
          default:
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
