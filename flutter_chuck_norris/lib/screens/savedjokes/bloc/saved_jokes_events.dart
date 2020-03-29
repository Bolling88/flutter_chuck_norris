import 'package:equatable/equatable.dart';

abstract class SavedJokeEvent extends Equatable{

  const SavedJokeEvent();

  @override
  List<Object> get props => [];
}

class JokeEventBlocCreated extends SavedJokeEvent {}
