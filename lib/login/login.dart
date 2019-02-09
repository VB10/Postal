import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
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
