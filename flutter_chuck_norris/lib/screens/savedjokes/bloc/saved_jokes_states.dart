import 'package:flutterchucknorris/api_models/joke_mapper.dart';
import 'package:flutterchucknorris/db/models/joke.dart';

abstract class SavedJokesStates {}
class NoJokesSavedState extends SavedJokesStates {}
class JokeFetchingState extends SavedJokesStates {}

class JokeFetchedState extends SavedJokesStates {
  final Joke joke;
  JokeFetchedState({this.joke});
}
class JokeErrorState extends SavedJokesStates {}
class JokeEmptyState extends SavedJokesStates {}
class JokeSavedState extends SavedJokesStates {}