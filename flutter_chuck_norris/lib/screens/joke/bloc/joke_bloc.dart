import 'package:flutterchucknorris/api_models/joke.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'joke_screen_events.dart';
import 'joke_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeBloc extends Bloc<JokeScreenEvents, JokeScreenState> {
  final JokeRepository jokeRepository;
  JokeBloc({this.jokeRepository}) : assert(jokeRepository != null);

  @override
  void onTransition(Transition<JokeScreenEvents, JokeScreenState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  JokeScreenState get initialState => JokeUninitializedState();

  @override
  Stream<JokeScreenState> mapEventToState(JokeScreenEvents event) async* {
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

  Future<JokeScreenState> refreshJoke(Joke joke) async {
       joke = await jokeRepository
        .getRandomJoke();
    if (joke == null) {
      return JokeEmptyState();
    } else {
      return JokeFetchedState(joke: joke);
    }
  }
}