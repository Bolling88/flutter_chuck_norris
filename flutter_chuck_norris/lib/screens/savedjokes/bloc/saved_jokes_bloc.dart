import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'saved_jokes_events.dart';
import 'saved_jokes_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedJokesBloc extends Bloc<SavedJokeEvent, SavedJokesStates> {
  final JokeRepository _jokeRepository;
  SavedJokesBloc(this._jokeRepository) : assert(_jokeRepository != null);

  @override
  void onTransition(Transition<SavedJokeEvent, SavedJokesStates> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  SavedJokesStates get initialState => NoJokesSavedState();

  @override
  Stream<SavedJokesStates> mapEventToState(SavedJokeEvent event) async* {
    try {
      switch(event.runtimeType){

      }
    } catch (_) {
      yield JokeErrorState();
    }
  }
}