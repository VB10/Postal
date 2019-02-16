import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:postal/tab/tab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();

  void onLoad(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
  } //callback when layout build done

}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void userControl() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TabPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Okey"),
        onPressed: () => this.userControl(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => TabPage())));
  }
}
