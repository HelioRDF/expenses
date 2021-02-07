import 'package:expenses/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new ScreenInitial(),
  ));
}

class ScreenInitial extends StatefulWidget {
  @override
  _ScreenInitialState createState() => new _ScreenInitialState();
}

class _ScreenInitialState extends State<ScreenInitial> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new Home(),
      title: new Text(
        'Bem-Vindo!',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.asset('imagens/investimento.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.blue,
    );
  }
}
