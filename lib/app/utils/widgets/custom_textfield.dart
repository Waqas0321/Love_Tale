import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, this.hint = 'Enter your first name', this.controller,
  });
  final String hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder( // Sets the default border style
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          borderSide: BorderSide(
            color: Colors.black, // Border color
            width: 2.0, // Border width
          ),
        ),
        hintText: hint, // Hint text
        hintStyle: TextStyle(
          color: Colors.grey, // Hint text color
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Padding inside the text field
        errorBorder: OutlineInputBorder( // Style for the error border
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red, // Error border color
            width: 2.0, // Error border width
          ),
        ),
        focusedErrorBorder: OutlineInputBorder( // Style for the focused error border
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.black, // Focused error border color
            width: 2.0, // Focused error border width
          ),
        ),
      ),
    );
  }
}