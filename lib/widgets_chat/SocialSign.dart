import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocialSign extends StatelessWidget {
  SocialSign({this.data, this.image});
  IconData? socialIconType;
  String? data;
  String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 60,
        width: 300,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffe8e8e8)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [Image.asset(image!), Text(data!)]),
        ),
      ),
    );
  }
}
