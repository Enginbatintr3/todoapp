import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  final String label;
  final String text;
  const TaskCard({
    Key key,
    @required this.label,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label == "" ? "Please Add Label!" : label,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              text == "" ? "Please Add Description!" : text,
              style: GoogleFonts.openSans(
                color: Colors.grey.shade600,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}
