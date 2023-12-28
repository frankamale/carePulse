

import 'package:carepulse/components/toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future <User?> signUpWithEmailAndPassword(String password, String email) async {

    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    on FirebaseException  catch(e){
      if(e.code == "email-already-in-use"){
        showToast(message: 'The email is already in use');
      }else{
        showToast(message: 'An error occured');
      }
    }
    return null;

  }
  Future <User?> logInWithEmailAndPassword(String password, String email) async {

    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    on FirebaseException catch(e){
      if(e.code == 'user-not-found' || e.code == 'wrong-password'){
        showToast(message: 'Invalid e-mail or password');
      }else{
        showToast(message: 'An error occured');
      }
    }
    return null;

  }

}