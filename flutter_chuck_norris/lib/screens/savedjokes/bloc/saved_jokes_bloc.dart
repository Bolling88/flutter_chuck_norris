import 'package:flutterchucknorris/db/models/joke.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'saved_jokes_events.dart';
import 'saved_jokes_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedJokesBloc extends Bloc<SavedJokeEvent, SavedJokesStates> {

  List<Joke> _allJokes;

  final JokeRepository _jokeRepository;
  SavedJokesBloc(this._jokeRepository){
    add(JokeEventBlocCreated());
  }

  @override
  void onTransition(Transition<SavedJokeEvent, SavedJokesStates> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  SavedJokesStates get initialState => SavedJokesLoadingState();

  @override
  Stream<SavedJokesStates> mapEventToState(SavedJokeEvent event) async* {
    try {
      switch(event.runtimeType){
        case JokeEventBlocCreated:
          _allJokes = await _jokeRepository.getAllJokes();
          yield SavedJokesLoadedState(_allJokes);
          break;
      }
    } catch (_) {
      yield SavedJokesErrorState();
    }
  }
}