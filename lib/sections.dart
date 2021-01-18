import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:gsheets/gsheets.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isSignedUp = false;
  Color _signupColor = const Color(0xFF96D763);
  String _status = "Sign Up!";

  void _changeIcon() {
    if (!_isSignedUp) {
      setState(() {
        _signupColor = const Color(0xFFe8e8e8);
        _status = "Sent";
        _isSignedUp = true;
      });
    } else {
      setState(() {
        _signupColor = const Color(0xFF96D763);
        _status = "Sign Up!";
        _isSignedUp = false;
      });
    }
  }

  Widget build(BuildContext context) {
    Widget iconBtn = IconButton(
      icon: Icon(Icons.done, color: _signupColor, size: 40.0),
      onPressed: _changeIcon,
    );

    return FlatButton(
        onPressed: _changeIcon,
        child: Column(children: <Widget>[
          iconBtn,
          Container(
            margin: const EdgeInsets.only(top: 0),
            child: Text(
              _status,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: _signupColor,
              ),
            ),
          ),
        ]));
  }
}

// FlatButton _buildButtonColumn(
//     IconButton iconButton, Color color, String label, double labelSize) {
//   return
// }
