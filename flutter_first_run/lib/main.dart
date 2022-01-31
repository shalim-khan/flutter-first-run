import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'utils.dart';

var mainText = ""; // For example, "This is NOT the first run"
var subText = "This app has been run ";
var subTextEnding = ""; // For example, "... 7 times"

void main() async {
  // Initialise local storage
  Box<dynamic> box = await initialiseLocalStorage();

  // Check how many times this app has been run, and increment by one
  var runCount = updateRunCount(box);

  // Set behaviour according to how many times the app has been run
  setDesiredBehaviour(runCount);

  // Run the app itself
  runApp(CleanApp(home: HomePage()));
}

Future<Box<dynamic>> initialiseLocalStorage() async {
  await Hive.initFlutter();
  await Hive.openBox('flutter-first-run-six'); // increment this to reset first run status for testing
  var box = Hive.box('flutter-first-run-six');
  return box;
}

updateRunCount(Box<dynamic> box) {
  var runCount = box.get('runCount', defaultValue: 0);
  runCount++;
  box.put('runCount', runCount);
  return runCount;
}

void setDesiredBehaviour(runCount) {
  if (runCount == 1) {
    mainText = "This is the first run";
    subTextEnding = "once";
  } else if (runCount == 2) {
    mainText = "This is NOT the first run";
    subTextEnding = "twice";
  } else {
    mainText = "This is NOT the first run";
    subTextEnding = "$runCount times";
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMainText(),
            SizedBox(height: 10),
            buildSubText(),
          ],
        ),
      ),
    );
  }

  Text buildMainText() {
    return Text(
      mainText,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(fontSize: 25),
    );
  }

  Text buildSubText() {
    return Text(
      subText + subTextEnding,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(fontSize: 15),
    );
  }
}
