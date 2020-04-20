import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreActions{
 
  final CollectionReference gameCollection = Firestore.instance.collection("Game");
 
  Future <void> insertNewGame(String name, int prize, String type) async{
      return await gameCollection.document("110").setData({
       "Name": name,
       "Prize": prize,
       "Type": type,
      });
  }

}