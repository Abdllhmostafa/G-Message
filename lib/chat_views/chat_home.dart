import 'package:flutter/material.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/Widgets_store/custom_button.dart';
import 'package:graduated_project/chat_views/chat_page.dart';

class ChatHomeView extends StatelessWidget {
  ChatHomeView({super.key});
  static String id = 'Chat Home';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              Icons.chat,
              size: 30,
            ),
          )
        ],
        title: Text(
          'Health Room',
          style: TextStyle(color: kDarkBlueColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: CustomButton(
                    text: 'Health Room Chat  >>',
                    onTap: () {
                      Navigator.pushNamed(context, ChatView.id,
                          arguments: email);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
