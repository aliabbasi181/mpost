import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocailAuthBloc with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> googleLogin() async {
    try {
      GoogleSignInAccount? googleAccount;
      googleAccount = await _googleSignIn.signIn();
      return googleAccount;
    } catch (ex) {
      print(ex);
    }
  }

  googleSignOut() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }
}
