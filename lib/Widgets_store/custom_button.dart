import 'package:flutter/material.dart';
import 'package:graduated_project/Consts_chat/consts.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.text});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        width: 250,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
