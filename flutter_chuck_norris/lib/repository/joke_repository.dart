import 'package:flutterchucknorris/api/joke_api.dart';
import 'package:flutterchucknorris/db/app_database.dart';
import 'package:flutterchucknorris/db/dao/joke_dao.dart';
import 'package:flutterchucknorris/db/models/joke.dart';

class JokeRepository {
  final JokeApi _jokeApi;
  final JokeDao _jokeDao;
  JokeRepository(this._jokeApi,  this._jokeDao);

  Future<Joke> fetchJoke() =>
      _jokeApi.fetchRandomJoke();
  
  Future<void> saveJoke(Joke joke){
    return _jokeDao.insertJoke(joke);
  }

  Future<void> deleteJoke(Joke joke){
    return _jokeDao.deleteJoke(joke);
  }

  Future<List<Joke>> getAllJokes(){
    return _jokeDao.getAllJokes();
  }
}