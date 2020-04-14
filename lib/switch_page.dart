import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taco_game/login_page.dart';
import 'package:taco_game/user.dart';
import 'home.dart';

class SwitchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userSatate = Provider.of<User>(context);
    if(userSatate==null){
       return LoginPage();
    }
    else{
      return Home();
    }

  }
}