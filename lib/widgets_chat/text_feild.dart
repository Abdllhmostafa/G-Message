import 'package:flutter/material.dart';

// ignore: must_be_immutable
class textFeild extends StatelessWidget {
  textFeild(
      {this.hinttext, this.type, this.onChange, this.obscureText = false});
  String? hinttext;
  Widget? type;
  Function(String)? onChange;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        obscureText: obscureText!,
        // ignore: body_might_complete_normally_nullable
        validator: (data) {
          if (data!.isEmpty) {
            return "required";
          }
        },
        onChanged: onChange,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            suffixIcon: type,
            hintText: hinttext,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 93, 105, 118))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 1, 125, 248))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xfff1f3f5)))),
      ),
    );
  }
}
