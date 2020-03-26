import 'package:flutterchucknorris/api_models/joke.dart';

abstract class SavedJokesScreenStates {}
class NoJokesSavedState extends SavedJokesScreenStates {}
class JokeFetchingState extends SavedJokesScreenStates {}

class JokeFetchedState extends SavedJokesScreenStates {
  final Joke joke;
  JokeFetchedState({this.joke});
}
class JokeErrorState extends SavedJokesScreenStates {}
class JokeEmptyState extends SavedJokesScreenStates {}
class JokeSavedState extends SavedJokesScreenStates {}