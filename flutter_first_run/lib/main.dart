import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

var displayText = "";

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('flutter-first-run-two'); // increment this to reset first run status for testing
  var box = Hive.box('flutter-first-run-two');

  var hasBeenRunBefore = box.get('hasBeenRunBefore');
  if (hasBeenRunBefore == null) {
    // FIRST RUN
    box.put('hasBeenRunBefore', 'yes');
    displayText = "This is the first run";
  } else {
    // NOT FIRST RUN
    displayText = "This is NOT the first run";
  }
  runApp(CleanApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedRocketShip(),
            SizedBox(height: 20),
            Text(
              displayText,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedRocketShip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.all(10.0),
      child: Image.asset(
        "images/rocket.gif",
        height: 120,
      ),
    );
  }
}

class CleanApp extends StatelessWidget {
  final Widget home;

  CleanApp({
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan, // iOS PWA status bar background color for light AND dark modes
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
    );
  }
}
