// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
 // كود الفايربيس
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import '../widgets/my_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = 'register_screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
   // كود الفايربيس
  // final _auth = FirebaseAuth.instance;
  // final _authweb = FirebaseAuthWeb.instance;
  late String email;
  late String password;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: 180,
                child: Image.asset('images/logo.png'),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'Enter your Email',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  labelText: 'Email',
                  // helperText: 'write your Email ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  labelText: 'Password',
                  // helperText: 'write your Password ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                color: Colors.blue[800]!,
                title: 'Register',
                onPressed: () async {
                  // print(email);
                  // print(password);
                  setState(() {
                    _saving = true;
                  });

                  try {
                     // كود الفايربيس
                    // final newUser = await _auth.createUserWithEmailAndPassword(
                    //     email: email, password: password);

                    // final newUserWeb = await _authweb
                    //     .createUserWithEmailAndPassword(email, password);

                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, ChatScreen.screenRoute);
                    setState(() {
                      _saving = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
