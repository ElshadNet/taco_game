import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taco_game/home.dart';
import 'package:taco_game/user.dart';

import 'firestore_actions.dart';
import 'game.dart';

class NewGame extends StatefulWidget {
  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
    TextEditingController nameController = new TextEditingController();
  TextEditingController prizeController = new TextEditingController();
   TextEditingController typeController = new TextEditingController();
  String name = '';
  int prize = 0;
  String type = '';
  @override
  Widget build(BuildContext context) {
      final user = Provider.of<User>(context);

    return StreamBuilder(
      stream: FirestoreActions(userID: user.userID).myGame,
      builder:(context, snapshot)  {
        if(snapshot.hasData){
              MyGame mygame = snapshot.data;
              nameController.text = mygame.name;
              prizeController.text= mygame.prize.toString();
              typeController.text = mygame.type;
        return Scaffold(
        appBar: AppBar(
          title: Text("New Game"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom:10.0),
                child: TextField(
                  controller: nameController,
                  onChanged: (value){
                    setState(() {
                      name = value;
                     
                    });
                    
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom:10.0),
                child: TextField(
                  controller: prizeController,
                  onChanged: (value){
                    setState(() {
                      prize = int.parse(value);
                    });
                    
                  },
                  decoration: InputDecoration(
                    hintText: "Prize",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom:10.0),
                child: TextField(
                  controller: typeController,
                  onChanged: (value){
                    setState(() {
                      type = value;
                    });
                    
                  },
                  decoration: InputDecoration(
                    hintText: "Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:10.0,bottom:10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        elevation: 10.0,
                        child: Text("Create"),
                        color: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () async{
                             FirestoreActions().insertNewGame(user.userID,name, prize, type);
                             Navigator.push(context, 
                             MaterialPageRoute(builder: (context)=> Home(),
                             ));
                        },
                      ),
                    ),
                    Container(width: 10.0,),
                    Expanded(
                      child: RaisedButton(
                        elevation: 10.0,
                        child: Text("Delete"),
                        color: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () async{
                            FirestoreActions().deleteGame(user.userID);
                        },
                      ),
                    ),
                                      Container(width: 10.0,),
                    Expanded(
                      child: RaisedButton(
                        elevation: 10.0,
                        child: Text("Cancel"),
                        color: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () async{
                            Navigator.push(context, 
                             MaterialPageRoute(builder: (context)=> Home(),
                             ));
                        },
                      ),
                    ),
                  ],
                ),           
              ),

            ],
          ),
        ),
        
      );
      }
   
      }

      ,
  
    );
  }
}