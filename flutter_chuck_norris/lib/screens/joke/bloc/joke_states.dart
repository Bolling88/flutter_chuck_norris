import 'package:equatable/equatable.dart';
import 'package:flutterchucknorris/api_models/joke_mapper.dart';
import 'package:flutterchucknorris/db/models/joke.dart';

abstract class JokeState extends Equatable{
  final Joke joke;
  const JokeState(this.joke);

  @override
  List<Object> get props => [joke];
}

class JokeUninitializedState extends JokeState {
  const JokeUninitializedState(Joke joke) : super(joke);
}

class JokeFetchingState extends JokeState {
  const JokeFetchingState(Joke joke) : super(joke);
}

class JokeFetchedState extends JokeState {
  const JokeFetchedState(Joke joke) : super(joke);
}

class JokeErrorState extends JokeState {
  const JokeErrorState(Joke joke) : super(joke);
}

class JokeEmptyState extends JokeState {
  const JokeEmptyState(Joke joke) : super(joke);
}

class JokeSavedState extends JokeState {
  const JokeSavedState(Joke joke) : super(joke);
}