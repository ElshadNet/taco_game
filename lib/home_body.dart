import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final listOfGames = Provider.of<List<Game>>(context);
    return ListView.builder(
      itemCount: listOfGames.length, 
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(child: Text(listOfGames[index].prize.toString()),),
          title: Text(listOfGames[index].name),
          subtitle: Text(listOfGames[index].type),
        );
      },
      
      
    );
  }
}