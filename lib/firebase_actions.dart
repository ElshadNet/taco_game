import 'package:firebase_auth/firebase_auth.dart';
import 'package:taco_game/user.dart';

class FirebaseActions{
  FirebaseAuth _auth = FirebaseAuth.instance;


 Stream<User> get userStream{
   return _auth.onAuthStateChanged.map((FirebaseUser user) => _actualUser(user));
 }



  User _actualUser(FirebaseUser user){
    return user!=null?User(userID: user.uid):null;
  }

  //Sign in Anonymous Method
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
  // Register With Email And Password
  Future regiterWithEmail(String email, String password) async{
    try{
    AuthResult rs = await _auth
    .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = rs.user;
    return User(userID: user.uid);
    }
    
       catch(errer){
          print(errer.toString());
          return null;
       }
  }

  //Sign In With Email     signInWithEmail
  Future signInWithEmail(String email, String password) async{
    try{
    AuthResult rs = await _auth
    .signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = rs.user;
    return User(userID: user.uid);
    }

       catch(errer){
          print(errer.toString());
          return null;
       }
  }
  
 

  //sign Out
    Future signOut() async{
     return await _auth.signOut();
  }
}