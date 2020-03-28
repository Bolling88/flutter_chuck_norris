import 'dart:convert';

import 'package:flutterchucknorris/api_models/joke.dart';
import 'package:http/http.dart' as http;

class JokeApi {

  final String _baseUrl = "https://api.chucknorris.io/jokes/random";
  final successCode = 200;

  Future<Joke> fetchRandomJoke() async {
    final response = await http.get(_baseUrl);

    return parseResponse(response);
  }

  Joke parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);

    if (response.statusCode == successCode) {
      return Joke.fromJson(responseString);
    } else {
      throw Exception('failed to load jokes');
    }
  }
}