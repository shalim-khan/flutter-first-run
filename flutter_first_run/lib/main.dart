import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

var displayText = "";
var subText = "This app has been run ";
var subTextEnding = "";

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(
      'flutter-first-run-six'); // increment this to reset first run status for testing
  var box = Hive.box('flutter-first-run-six');

  var runCount = box.get('runCount', defaultValue: 0);
  runCount++;
  box.put('runCount', runCount);

  if (runCount == 1) {
    displayText = "This is the first run";
    subTextEnding = "once";
  } else if (runCount == 2) {
    displayText = "This is NOT the first run";
    subTextEnding = "twice";
  } else {
    displayText = "This is NOT the first run";
    subTextEnding = "$runCount times";
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
            Text(
              displayText,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Text(
              subText + subTextEnding,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 15,
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
        primaryColor: Colors
            .cyan, // iOS PWA status bar background color for light AND dark modes
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
    );
  }
}
