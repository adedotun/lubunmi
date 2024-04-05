import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


class UserRepo{
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _fblogin;

  UserRepo({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn, FacebookLogin fblogin})
  : _auth = firebaseAuth ?? FirebaseAuth.instance,
    _googleSignIn= googleSignIn ?? GoogleSignIn(),
    _fblogin=fblogin ?? FacebookLogin();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    return _auth.currentUser();
  }

  Future<FirebaseUser> facebookLogin() async {
    FirebaseUser currentUser;
    _fblogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    try{
      final FacebookLoginResult facebookLoginResult =
          await _fblogin.logIn(['email']);
      if(facebookLoginResult.status==FacebookLoginStatus.loggedIn){
        FacebookAccessToken facebookAccessToken =
            facebookLoginResult.accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: facebookAccessToken.token
        );
        final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
        assert(user.email !=null);
        assert(user.displayName!=null);
        assert(!user.isAnonymous);
        assert(await user.getIdToken()!=null);
        currentUser = await _auth.currentUser();
        assert(user.uid==currentUser.uid);
        return currentUser;
      }
    }catch (e){
      print(e);
    }
    return _auth.currentUser();
  }


  Future<void>signInWithCredentials(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String email, String password){
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  Future<void> signOut() async{
    return Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
      _fblogin.logOut()
    ]);
  }

  Future<bool> isSignedIn() async{
    final currentUser= await _auth.currentUser();
    return currentUser!= null;
  }

  Future<String> getUser() async{
    return(await _auth.currentUser()).email;
  }
}