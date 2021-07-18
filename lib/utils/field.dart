import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        hintStyle: GoogleFonts.openSans(color: Colors.black87, fontSize: 16),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    ),
  );
}
