import 'package:flutterchucknorris/api_models/joke.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'saved_jokes_screen_events.dart';
import 'saved_jokes_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedJokesBloc extends Bloc<SavedJokesScreenEvents, SavedJokesScreenStates> {
  final JokeRepository jokeRepository;
  SavedJokesBloc({this.jokeRepository}) : assert(jokeRepository != null);

  @override
  void onTransition(Transition<SavedJokesScreenEvents, SavedJokesScreenStates> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  SavedJokesScreenStates get initialState => NoJokesSavedState();

  @override
  Stream<SavedJokesScreenStates> mapEventToState(SavedJokesScreenEvents event) async* {
    Joke joke;
    try {
      switch(event.runtimeType){
        case ClickedNewJokeEvent:
          yield JokeFetchingState();
          yield await refreshJoke(joke);
          break;
        case ShareJokeEvent:
          break;
        case LongPressedJokeEvent:
          break;
      }
    } catch (_) {
      yield JokeErrorState();
    }
  }

  Future<SavedJokesScreenStates> refreshJoke(Joke joke) async {
       joke = await jokeRepository
        .getRandomJoke();
    if (joke == null) {
      return JokeEmptyState();
    } else {
      return JokeFetchedState(joke: joke);
    }
  }
}