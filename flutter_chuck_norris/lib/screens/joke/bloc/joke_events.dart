import 'package:equatable/equatable.dart';

abstract class JokeEvent extends Equatable {
  const JokeEvent();

  @override
  List<Object> get props => [];
}

class JokeEventRefresh extends JokeEvent {}

class JokeEventSave extends JokeEvent {}
