import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchucknorris/bloc/joke_bloc.dart';
import 'package:flutterchucknorris/bloc/joke_events.dart';
import 'package:flutterchucknorris/repository/joke_repository.dart';
import 'package:flutterchucknorris/widgets/joke_widget.dart';

class JokeView extends StatefulWidget {
  final JokeRepository jokeRepository;
  JokeView({this.jokeRepository});

  @override
  _JokeViewState createState() => _JokeViewState();
}

class _JokeViewState extends State<JokeView>{
  JokeBloc _jokeBloc;

  @override
  void initState() {
    super.initState();
    _jokeBloc = JokeBloc(jokeRepository: widget.jokeRepository);
  }

  @override
  void dispose() {
    super.dispose();
    _jokeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>_jokeBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Chuck Jokes',style: TextStyle(color: Colors.white,fontSize: 30.0,),),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: new Stack(
            children: <Widget>[Align(
              child: new JokeWidget(),
              alignment: Alignment.center,
            ), Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                color: Colors.blue,
                child: Text("Click for a new joke"),
                  onPressed: (){
                    _jokeBloc.add(NewJokeEvent());
                  },
              ),
            )],
          )
        ),
      ),
    );
  }
}