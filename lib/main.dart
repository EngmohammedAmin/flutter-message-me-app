// كود الفايربيس
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import 'package:messageme_app/screens/login_screen.dart';
import 'package:messageme_app/screens/registration_screen.dart';

import 'screens/welcome_screen.dart';

void main() async {
  try {
    // كود الفايربيس
    WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp();
    // await Firebase.initializeApp(options: options);
    runApp(MyApp());
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meassage Me App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const WelcomeScreen(),
      // home: const RegistrationScreen(),
      // home: const LoginScreen(),
      // home: const ChatScreen(),
      initialRoute: _auth.currentUser != null
          ? ChatScreen.screenRoute
          : WelcomeScreen.screenRoute,
      // initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
        RegistrationScreen.screenRoute: (context) => const RegistrationScreen(),
        LoginScreen.screenRoute: (context) => const LoginScreen(),
        ChatScreen.screenRoute: (context) => const ChatScreen(),
      },
    );
  }
}
