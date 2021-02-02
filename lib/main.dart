import 'package:expenses/view/splashScreen.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ScreenInitial(),
      theme: ThemeData(
        //primaryColor: Colors.yellow,
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(fontFamily: 'OpenSans'),
            button: TextStyle(color: Colors.white)),
      ),
    );
  }
}
