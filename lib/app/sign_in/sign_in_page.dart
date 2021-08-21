import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hanoiapp/app/sign_in/sign_in_button.dart';
import 'package:hanoiapp/app/sign_in/social_sign_button.dart';
import 'package:hanoiapp/services/auth.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key,required this.auth}) : super(key: key);
  final AuthBase auth;
  Future<void> _SignInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch(error) {
      print(error.toString());
    }
  }
  Future<void> _SignInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch(error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        centerTitle: true,
        elevation: 100.0,
      ),
      body: _BuildContent(),
      backgroundColor: Colors.grey[200],
    );
  }
  //private content
  Widget _BuildContent() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Text(
               'Sign in',
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold
             ),
           ),
            SizedBox(
              height: 8.0,
            ),
            SocialSignButton(
                text: 'Sign in with google',
                textColor: Colors.black87,
                color: Colors.white,
                onPressed: _SignInWithGoogle,
                pathImage: 'images/google-logo.png'
            ),
            SizedBox(
              height: 8.0,
            ),
            SocialSignButton(
                text: 'Sign in with facebook',
                textColor: Colors.white,
                color: Colors.blueAccent,
                onPressed: () {

                },
                pathImage: 'images/facebook-logo.png'
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
                text: 'Sign in with email',
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: () {

                }
            ),
            SizedBox(
              height: 8.0,
            ),
            Text('Or',
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
                text: 'Go to anonmous',
                color: Colors.lime,
                textColor: Colors.black87,
                onPressed: () => _SignInAnonymously(),
            ),
          ],
        ),
      ),
    );
  }
}