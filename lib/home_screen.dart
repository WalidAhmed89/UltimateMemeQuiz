import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Quiz.dart';
import 'package:quiz/questions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.switchScreen,{super.key});

  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/meme.png", height: 200),
        SizedBox(height: 30),
        Text(
          "Meme Knowledge Test",
          style: GoogleFonts.luckiestGuy(color: Colors.black, fontSize: 25),
        ),
        SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: switchScreen,
          icon: Icon(Icons.arrow_back, color: Colors.black),
          label: Text(
            "Start Quiz",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
