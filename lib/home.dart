import 'package:flutter/material.dart';
import 'package:taco_game/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TACO Game Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async{
              print("Logout");
              await signOut();
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> LoginPage()));
            },
          ),
        ],
      ),
    );
  }

  Future signOut() async{
     return await _auth.signOut();
  }
}