import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:postal/tab/tab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';



class Login extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  BuildContext _context = null;

  Login() {
    if (_context != null) {
      Navigator.push(
          _context, MaterialPageRoute(builder: (context) => TabPage()));
    } else {
      print("false");
    }
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    return user;
  }

  _saveUserID(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString(PREFKEY.userId.toString(), userId);
    if (PREFKEY.userId.toString().isNotEmpty) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
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
                    _handleSignIn().then((FirebaseUser user) {
                      _saveUserID(user.uid);
                    }).catchError((e) => print(e));
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
