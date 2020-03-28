import 'package:flutterchucknorris/api/joke_api.dart';
import 'package:flutterchucknorris/api_models/joke.dart';

class JokeRepository {
  final JokeApi _jokeApi;
  JokeRepository(this._jokeApi);

  Future<Joke> getRandomJoke() =>
      _jokeApi.fetchRandomJoke();
}