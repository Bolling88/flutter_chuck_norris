import 'package:floor/floor.dart';
import 'package:flutterchucknorris/db/models/joke.dart';

@dao
abstract class JokeDao{
  @Query('SELECT * FROM Joke')
  Future<List<Joke>> getAllJokes();

  @Query('SELECT * FROM Joke')
  Stream<List<Joke>> getStreamAllJokes();

  @Query('SELECT * FROM Joke WHERE id = :id')
  Future<Joke> getJokeById(int id);

  @Query('SELECT * FROM Joke WHERE id = :id')
  Stream<Joke> getStreamJokeById(int id);

  @insert
  Future<void> insertJoke(Joke joke);

  @delete
  Future<int> deleteJoke(Joke joke);
}