import 'package:flutter/material.dart';

import 'firestore_actions.dart';

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
                           FirestoreActions().insertNewGame(name, prize, type);
                      },
                    ),
                  ),
                  Container(width: 10.0,),
                  Expanded(
                    child: RaisedButton(
                      elevation: 10.0,
                      child: Text("Cancle"),
                      color: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () async{
  

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