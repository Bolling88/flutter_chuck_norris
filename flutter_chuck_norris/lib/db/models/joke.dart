import 'package:floor/floor.dart';
import 'package:flutterchucknorris/api_models/joke_mapper.dart';

@entity
class Joke {
  @primaryKey
  final String id;
  final String iconUrl;
  final String url;
  final String value;

  Joke(this.iconUrl, this.id, this.url, this.value);

  Joke.fromJokeMapper(JokeMapper mapper)
      : iconUrl = mapper.iconUrl,
        id = mapper.id,
        url = mapper.url,
        value = mapper.value;
}
