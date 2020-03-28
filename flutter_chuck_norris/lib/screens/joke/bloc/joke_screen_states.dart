import 'package:equatable/equatable.dart';
import 'package:flutterchucknorris/api_models/joke.dart';

abstract class JokeScreenState extends Equatable{
  final Joke joke;
  const JokeScreenState(this.joke);

  @override
  List<Object> get props => [joke];
}

class JokeUninitializedState extends JokeScreenState {
  const JokeUninitializedState(Joke joke) : super(joke);
}

class JokeFetchingState extends JokeScreenState {
  const JokeFetchingState(Joke joke) : super(joke);
}

class JokeFetchedState extends JokeScreenState {
  const JokeFetchedState(Joke joke) : super(joke);
}

class JokeErrorState extends JokeScreenState {
  const JokeErrorState(Joke joke) : super(joke);
}

class JokeEmptyState extends JokeScreenState {
  const JokeEmptyState(Joke joke) : super(joke);
}

class JokeSavedState extends JokeScreenState {
  const JokeSavedState(Joke joke) : super(joke);
}