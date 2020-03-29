import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/joke_dao.dart';
import 'models/joke.dart';

part 'app_database.g.dart'; // the generated code will be there

///https://pub.dev/packages/floor#-readme-tab-
/// Run the generator with
/// flutter packages pub run build_runner build.
/// To automatically run it, whenever a file changes, use
/// flutter packages pub run build_runner watch
@Database(version: 1, entities: [Joke])
abstract class AppDatabase extends FloorDatabase {
  JokeDao get jokeDao;
}