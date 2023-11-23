import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_firebase/firebase_options.dart';
import 'package:twitter_clone_firebase/view/pages/auth/login_page.dart';
import 'package:twitter_clone_firebase/view/pages/auth/register_page.dart';
import 'package:twitter_clone_firebase/themes/dark_mode.dart';
import 'package:twitter_clone_firebase/themes/light_mode.dart';
import 'package:twitter_clone_firebase/view/pages/auth/splashscreen.dart';
import 'package:twitter_clone_firebase/view/pages/home/home_page.dart';
import 'package:twitter_clone_firebase/view/pages/profile/profile_page.dart';
import 'package:twitter_clone_firebase/view/pages/users/users_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: lightMode,
      darkTheme: darkMode,
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => Splashscreen(),
        '/sign-in': (context) => LoginPage(),
        '/sign-up': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/users': (context) => UsersPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
