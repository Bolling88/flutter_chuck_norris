import 'package:flutterchucknorris/api_models/joke.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'saved_jokes_screen_events.dart';
import 'saved_jokes_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedJokesBloc extends Bloc<SavedJokesScreenEvents, SavedJokesScreenStates> {
  final JokeRepository _jokeRepository;
  SavedJokesBloc(this._jokeRepository) : assert(_jokeRepository != null);

  @override
  void onTransition(Transition<SavedJokesScreenEvents, SavedJokesScreenStates> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  SavedJokesScreenStates get initialState => NoJokesSavedState();

  @override
  Stream<SavedJokesScreenStates> mapEventToState(SavedJokesScreenEvents event) async* {
    try {
      switch(event.runtimeType){

      }
    } catch (_) {
      yield JokeErrorState();
    }
  }
}