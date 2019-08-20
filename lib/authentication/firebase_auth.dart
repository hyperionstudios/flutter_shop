import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signOut() async{
    await _firebaseAuth.signOut();
  }

  Future<FirebaseUser> getCurrentUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    print(user);
    return user;
  }

  Future<FirebaseUser> sigIn( String email , String password ) async{
    AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }

  Future<FirebaseUser> register( String email , String password ) async{
    AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }

}