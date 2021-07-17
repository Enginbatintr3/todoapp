import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_x/screens/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                height: 100,
                width: 100,
                image: AssetImage("assets/images/logo.png"),
              ),
              Text(
                "Notes App | By Engin",
                style: GoogleFonts.openSans(
                  color: Colors.indigo,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Button3D(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text("Start"),
                style: StyleOf3dButton(
                  backColor: Colors.indigo[300],
                  topColor: Colors.indigo[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
