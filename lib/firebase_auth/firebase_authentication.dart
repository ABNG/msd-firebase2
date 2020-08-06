import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuths {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = authResult.user;
    } catch (e) {
      print(e.toString());
      return false;
    }
    return true;
  }

  Future<bool> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = authResult.user;
    } catch (e) {
      print(e.toString());
      return false;
    }
    return true;
  }

  FirebaseUser getCurrentUser() {
    if (user != null) {
      return user;
    }
    return null;
  }

  Future<bool> signInWithGmail() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      user = authResult.user;
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
