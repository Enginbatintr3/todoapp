import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class task extends StatelessWidget {
  String label;
  String text;
  task({Key key, this.label, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  style: GoogleFonts.openSans(
                      color: Colors.grey.shade600, fontSize: 15),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
