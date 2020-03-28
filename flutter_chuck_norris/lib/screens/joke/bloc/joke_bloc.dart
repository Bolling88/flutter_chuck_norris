import 'package:flutterchucknorris/api_models/joke.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'joke_screen_events.dart';
import 'joke_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeBloc extends Bloc<JokeEvent, JokeScreenState> {
  final JokeRepository _jokeRepository;
  Joke _currentJoke;

  JokeBloc(this._jokeRepository) : assert(_jokeRepository != null);

  @override
  void onTransition(Transition<JokeEvent, JokeScreenState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  JokeScreenState get initialState => JokeUninitializedState(null);

  @override
  Stream<JokeScreenState> mapEventToState(JokeEvent event) async* {
    try {
      switch(event.runtimeType){
        case JokeEventRefresh:
          yield JokeFetchingState(null);
          _currentJoke = await refreshJoke();
          if (_currentJoke == null) {
            yield JokeEmptyState(null);
          } else {
            yield JokeFetchedState(_currentJoke);
          }
          break;
        case JokeEventSave:
          yield JokeSavedState(_currentJoke);
          break;
      }
    } catch (_) {
      yield JokeErrorState(null);
    }
  }

  Future<Joke> refreshJoke() async {
       return await _jokeRepository
        .getRandomJoke();
  }
}