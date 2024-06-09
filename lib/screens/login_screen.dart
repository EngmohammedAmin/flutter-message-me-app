import 'package:flutter/material.dart';
// كود الفايربيس
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:messageme_app/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/my_button.dart';

class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // كود الفايربيس
  // final _auth = FirebaseAuth.instance;
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
                color: Colors.yellow[800]!,
                title: 'Login',
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });

                  try {
                    // كود الفايربيس
                    // final user = await _auth.signInWithEmailAndPassword(
                    //     email: email, password: password);
                    // if (user != null) {
                    //   // ignore: use_build_context_synchronously
                    //   Navigator.pushNamed(context, ChatScreen.screenRoute);
                    //   setState(() {
                    //     _saving = false;
                    //   });
                    // }
                    Navigator.pushNamed(context, ChatScreen.screenRoute);
                    setState(() {
                      _saving = false;
                    });
                  } catch (e) {
                    // ignore: avoid_print
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
