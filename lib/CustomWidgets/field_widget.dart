import 'package:flutter/material.dart';
Widget kField({
  required String text,
  required TextEditingController controller,
  required IconButton btn,
})
{
  return
      TextField(
        controller:controller ,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: btn,
          hintText: text,
          filled: true,
          fillColor: Colors.white,
        ),

      );
}