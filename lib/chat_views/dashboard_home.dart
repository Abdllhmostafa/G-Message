import 'package:flutter/material.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/booking_views/Views/Dashboard_screen.dart';
import 'package:graduated_project/chat_views/chat_page.dart';

class DashHome extends StatelessWidget {
  DashHome({super.key});
  static String id = 'dashboard';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Chat to diagonise',
          style: TextStyle(color: kDarkBlueColor),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Dashboard.id);
          },
          child: Center(child: Text('Click to chat'))),
    );
  }
}
