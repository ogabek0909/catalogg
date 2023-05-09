// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final String hintText;
  final String helperText;
  final Widget perfixIcon;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  const TextFieldForm({
    super.key,
    required this.hintText,
    required this.perfixIcon,
    required this.controller,
     this.helperText = '',
    this.validator,
    this.inputType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText),
          Container(
            child: TextFormField(
              validator: validator,
              keyboardType: inputType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 248, 246, 246),
                hintText: helperText,
                // label: Text(
                //   hintText,
                //   style: const TextStyle(color: Colors.blue),
                // ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: perfixIcon,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
