import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/chat_views/RegisterPage.dart';
import 'package:graduated_project/chat_views/chat_page.dart';
import 'package:graduated_project/chat_views/main_home_page.dart';
import 'package:graduated_project/widgets_chat/SocialSign.dart';
import 'package:graduated_project/widgets_chat/button.dart';
import 'package:graduated_project/widgets_chat/text_feild.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = "login page";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log in"),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              textFeild(
                onChange: (data) {
                  email = data;
                },
                hinttext: "Enter your mail",
                type: const Icon(Icons.email),
              ),
              const SizedBox(
                height: 20,
              ),
              textFeild(
                onChange: (data) {
                  password = data;
                },
                obscureText: true,
                hinttext: "Enter password",
                type: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await UserLogin();
                      Navigator.pushNamed(context, MainHomeView.id,
                          arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-email') {
                        ShowSnakeBar(context, 'Invalid Email');
                      } else if (e.code == 'user-not-found') {
                        ShowSnakeBar(context, 'User not found for this Email');
                      } else if (e.code == 'wrong-password') {
                        ShowSnakeBar(context, 'Wrong Password');
                      } else {
                        ShowSnakeBar(
                            context, 'Unexpected error during sign-in: $e');
                      }
                      print('Firebase Authentication Exception: $e');
                    } catch (e) {
                      ShowSnakeBar(
                          context, 'Unexpected error during sign-in: $e');
                      print('Firebase Authentication Exception: $e');
                    }
                    isLoading = false;
                    setState(() {});
                  } else {}
                },
                buttonText: "Sign up",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account?"),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterView.id);
                      },
                      child: Text(
                        "  Regester",
                        style: TextStyle(color: kPrimaryColor),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Divider(
                  color: Color(0xffe8e8e8),
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // SocialSign(
              //   data: "    Sign in with Google",
              //   image: "Assets/images/Google.png",
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SocialSign(
              //   data: "    Sign in with Facebook",
              //   image: "Assets/images/facebook.png",
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SocialSign(
              //   data: "    Sign in with Apple",
              //   image: "Assets/images/apple.png",
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UserLogin() async {
    var auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }

  void ShowSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
