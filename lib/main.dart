import 'package:flutter/material.dart';
import 'package:taco_game/switch_page.dart';
import 'package:provider/provider.dart';
import 'package:taco_game/user.dart';
import 'firebase_actions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
        value: FirebaseActions().userStream,
          child: MaterialApp(
               title: 'Flutter Demo',
               theme: ThemeData(
               primarySwatch: Colors.blue,
               ),
               home: SwitchPage(),
      ),
    );


  }
}

