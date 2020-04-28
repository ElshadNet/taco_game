import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taco_game/firestore_actions.dart';
import 'package:taco_game/new_game.dart';
import 'firebase_actions.dart';
import 'game.dart';
import 'home_body.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Game>>.value(
      value: FirestoreActions().games,
          child: Scaffold(
        appBar: AppBar(
          title: Text("TACO Game Home"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async{
                print("Logout");
                await FirebaseActions().signOut();

              },
            ),
          ],
        ),
        body: HomeBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
              Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => NewGame()),
  );
          
          },
        ),
      ),
    );
  }


}