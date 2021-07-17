import 'package:flutter/material.dart';

Container myMethod(TextEditingController controller, String text) {
  return Container(
    margin: const EdgeInsets.all(15),
    child: TextField(
      controller: controller,
      onChanged: (value) {
        //Do something with the user input.
      },
      decoration: InputDecoration(
        hintText: text,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    ),
  );
}
