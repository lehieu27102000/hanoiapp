import 'package:flutter/material.dart';
import 'package:hanoiapp/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;
  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page', textAlign: TextAlign.center,),
        actions: <Widget>[
          FlatButton(
              onPressed: _signOut,
              child: Text('Logout', style: TextStyle(fontSize: 18.0, color: Colors.white),)
          )
        ],
      ),
    );
  }
}
