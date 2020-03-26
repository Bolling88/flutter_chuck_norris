import 'package:flutterchucknorris/api_models/joke.dart';

abstract class JokeScreenState {}
class JokeUninitializedState extends JokeScreenState {}
class JokeFetchingState extends JokeScreenState {}

class JokeFetchedState extends JokeScreenState {
  final Joke joke;
  JokeFetchedState({this.joke});
}
class JokeErrorState extends JokeScreenState {}
class JokeEmptyState extends JokeScreenState {}
class JokeSavedState extends JokeScreenState {}