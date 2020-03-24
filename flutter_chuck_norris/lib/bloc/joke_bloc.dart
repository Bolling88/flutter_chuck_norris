import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_models/joke.dart';
import 'joke_events.dart';
import 'joke_view_states.dart';

class JokeBloc extends Bloc<JokeEvents, JokeViewStates> {
  final JokeRepository jokeRepository;
  JokeBloc({this.jokeRepository}) : assert(jokeRepository != null);

  @override
  void onTransition(Transition<JokeEvents, JokeViewStates> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  JokeViewStates get initialState => JokeUninitializedState();

  @override
  Stream<JokeViewStates> mapEventToState(JokeEvents event) async* {
    yield JokeFetchingState();
    Joke joke;
    try {
      if (event is NewJokeEvent) {
        joke = await jokeRepository
            .getRandomJoke();
      } else if (event is ShareJokeEvent) {
       //TODO share the joke
      }
      if (joke == null) {
        yield JokeEmptyState();
      } else {
        yield JokeFetchedState(joke: joke);
      }
    } catch (_) {
      yield JokeErrorState();
    }
  }
}