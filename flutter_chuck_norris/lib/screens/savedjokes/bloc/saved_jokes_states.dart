import 'package:equatable/equatable.dart';
import 'package:flutterchucknorris/db/models/joke.dart';

abstract class SavedJokesStates extends Equatable{
  const SavedJokesStates();

  @override
  List<Object> get props => [];
}

class SavedJokesLoadingState extends SavedJokesStates {}

class SavedJokesLoadedState extends SavedJokesStates {
  final List<Joke> jokes;
  const SavedJokesLoadedState(this.jokes);

  @override
  List<Object> get props => [jokes];
}

class SavedJokesEmptyState extends SavedJokesStates {}

class SavedJokesErrorState extends SavedJokesStates {}