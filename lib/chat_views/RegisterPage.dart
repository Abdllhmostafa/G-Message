import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/chat_views/chat_page.dart';
import 'package:graduated_project/chat_views/main_home_page.dart';
import 'package:graduated_project/widgets_chat/button.dart';
import 'package:graduated_project/widgets_chat/text_feild.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});
  static String id = "registerpage";
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          title: const Text("Register"),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: ListView(children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
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
              hinttext: "Enter passward",
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
                    await RsgesterUser();
                    Navigator.pushNamed(context, MainHomeView.id,
                        arguments: email);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ShowSnakeBar(context, 'weak-password');
                    } else if (e.code == 'email-already-in-use') {
                      {
                        ShowSnakeBar(context, 'email-already-in-use');
                      }
                    }
                  } catch (e) {
                    ShowSnakeBar(context, 'error');
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
                const Text("I have an account ."),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "  Login",
                      style: TextStyle(color: kPrimaryColor),
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void ShowSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> RsgesterUser() async {
    var auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
