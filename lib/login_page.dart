import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_actions.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //FirebaseActions fa = FirebaseActions();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  String email = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom:10.0),
              child: TextField(
                controller: emailController,
                onChanged: (value){
                  setState(() {
                    email = value;
                    print(email);
                  });
                  
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom:10.0),
              child: TextField(
                controller: passController,
                onChanged: (value){
                  setState(() {
                    pass = value;
                    print(pass);
                  });
                  
                },
                decoration: InputDecoration(
                  hintText: "Password",
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
                      child: Text("Login"),
                      color: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () async{
                        print("Login");
                         dynamic user = await FirebaseActions().signInWithEmail(email, pass);
                         if(user!=null){
                           print(user.userID);
                         
                         }
                         else{
                           print("Envaled Email OR Passord");
                         }                       

                      },
                    ),
                  ),
                  Container(width: 10.0,),
                  Expanded(
                    child: RaisedButton(
                      elevation: 10.0,
                      child: Text("Sign Up"),
                      color: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () async{
                        print("Sign Up");
                        dynamic user = await FirebaseActions().regiterWithEmail(email, pass);
                         if(user!=null){
                           print(user.userID);
                         }
                         else{
                           print("Registre Error");
                         }

                      },
                    ),
                  ),
                ],
              ),           
            ),
             Padding(
               padding: EdgeInsets.only(top:10.0, bottom:10.0),
               child: Center(
                 child: FlatButton(
                   child: Text("Login As Demo"),
                   onPressed: () async{
                      dynamic user = await FirebaseActions().signInAsDemo();
                        if(user!=null){
                          print(user.userID);
                        }
                        else{
                          print("Sign in As Demo have some error");
                        }
                      },
                   ),
               ),
             ),
          ],
        ),
      ),
      
    );
  }


  

}