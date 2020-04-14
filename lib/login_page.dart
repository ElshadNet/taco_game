import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';
import 'home.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = new TextEditingController();
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
                controller: emailController,
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
                      onPressed: () {
                        print("Login");

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
                      onPressed: (){
                        print("Sign Up");
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
                      dynamic user = await signInAsDemo();
                        if(user!=null){
                          print(user.userID);
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=> Home()));
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

  Future signInAsDemo() async{
       try{
        AuthResult rs   =  await _auth.signInAnonymously();
        FirebaseUser user = rs.user;
        return User(userID: user.uid);
       }
       catch(errer){
          print(errer.toString());
          return null;
       }

  }
  

}