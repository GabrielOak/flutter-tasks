import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({Key? key, required this.hintText, required this.controller})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: hintText,
        ));
  }
}
