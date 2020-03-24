import 'package:flutterchucknorris/api/joke_api.dart';
import 'package:flutterchucknorris/api_models/joke.dart';

class JokeRepository {
  JokeApi _playerApiProvider = JokeApi();

  Future<Joke> getRandomJoke() =>
      _playerApiProvider.fetchRandomJoke();
}