import 'package:flutter/material.dart';

class Loading_page extends StatelessWidget {
  const Loading_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        "Loading...",
        style: TextStyle(fontSize: 20, color: Colors.black),
      )),
    );
  }
}
