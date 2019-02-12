import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Login extends StatelessWidget {
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = await _auth.signInWithCredential(credential);
  print("signed in " + user.displayName);
  return user;
}
  Widget _buildText(
      {String text, Color color, Color textColor = Colors.white}) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 32.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/image/login.png"),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text("Profile",
                    style: const TextStyle(
                        color: const Color(0xff191660),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Google Sans",
                        decorationColor: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 27.0)),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment(10, 0),
                  child: Text(
                      "Store your GoPostaI in the cloud and have them backed up automatically",
                      textDirection: TextDirection.ltr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Google Sans",
                          fontStyle: FontStyle.normal,
                          decorationColor: Colors.white,
                          fontSize: 15.0)),
                ),
                SizedBox(height: 20),
                //hex color 0xFF+hex
                RaisedButton(
                  onPressed: () {
                    _handleSignIn()
    .then((FirebaseUser user) => print(user))
    .catchError((e) => print(e));
                  },
                  color: Color(0xFF00E381),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                  ),
                  child: Text("Sign up with email",
                      style: const TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Google Sans",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0)),
                ),
                SizedBox(height: 20),
                Text("I have an account",
                    style: const TextStyle(
                        color: Color(0xff191660),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Google Sans",
                        fontStyle: FontStyle.normal,
                        decorationColor: Colors.white,
                        fontSize: 15.0))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
