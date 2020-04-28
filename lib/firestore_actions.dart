import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taco_game/firebase_actions.dart';

import 'game.dart';

class FirestoreActions{
  String userID;
  FirestoreActions({this.userID});
 
  final CollectionReference gameCollection = Firestore.instance.collection("Game");


  Future <void> insertNewGame(String userID,String name, int prize, String type) async{
      return await gameCollection.document(userID).setData({
       "Name": name,
       "Prize": prize,
       "Type": type,
      });
  }
  
  List<Game>_convertDataToGame(QuerySnapshot snap){
     return snap.documents.map((index){
          return Game(
            name: index.data["Name"],
            prize: index.data["Prize"],
            type: index.data["Type"],
          );
     }).toList();
  }

  Stream <List<Game>> get games{
    return gameCollection.snapshots()
    .map((QuerySnapshot snap)=> _convertDataToGame(snap));
  }
  MyGame selectMyGame(DocumentSnapshot index){
        
          return MyGame(
            id: userID,
            name: index.data["Name"],
            prize: index.data["Prize"],
            type: index.data["Type"],
          );
     
  }
  Stream <MyGame> get myGame{
    return gameCollection.document(userID).snapshots()
           .map((DocumentSnapshot snap)=> selectMyGame(snap));
  }
  deleteGame (String documentID){
      gameCollection.document(documentID).delete();
  }
}