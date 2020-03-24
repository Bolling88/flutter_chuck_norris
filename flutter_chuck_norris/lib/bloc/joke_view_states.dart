import '../api_models/joke.dart';

abstract class JokeViewStates {}
class JokeUninitializedState extends JokeViewStates {}
class JokeFetchingState extends JokeViewStates {}

class JokeFetchedState extends JokeViewStates {
  final Joke joke;
  JokeFetchedState({this.joke});
}
class JokeErrorState extends JokeViewStates {}
class JokeEmptyState extends JokeViewStates {}