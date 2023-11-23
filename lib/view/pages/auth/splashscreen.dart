import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_firebase/view/pages/auth/login_page.dart';
import 'package:twitter_clone_firebase/view/pages/home/home_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User Logged in
          if (snapshot.hasData) {
            return HomePage();
          }
          // User NOT logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
