import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text(
                'Login with google',
              ),

              RaisedButton.icon(
                icon: Icon(Icons.person),
                label: Text('Login'),
                onPressed: () {
                  print('log in now');
                  this._handleSignIn();
                },
              )

            ],
          ),
        )
      ),
    );
  }



  Future<void> _handleSignIn() async {
    try {
      // await _googleSignIn.signIn();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      print('ssss');
      print(googleUser.displayName);
      // print(googleAuth);

    } catch (error) {
      print('eeee');
      print(error);
    }
  }// Future<void> _handleSignIn() async { .. }

}
