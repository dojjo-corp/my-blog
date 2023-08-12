import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final Widget labelText;
  final TextEditingController controller;
  // ignore: prefer_function_declarations_over_variables
  final String? Function(String?)? validator = (value){
    return value!.isEmpty ? 'Field ca\'t be empty':null;
  };

  // constructor with formal parameter intiations
  MyTextField({
    super.key,
    required this.obscureText,
    required this.hintText,
    required this.controller,
    required this.labelText,
    validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey[600],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        )),
        label: labelText,
        labelStyle: TextStyle(color: Colors.grey[800]),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[300]),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}

final form = TextFormField();
