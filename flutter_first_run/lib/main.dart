import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'animated_calendar.dart';
import 'utils.dart';

var mainText = "";

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('flutter-first-run-eleven');

  var runCount = box.get('runCount', defaultValue: 0);
  runCount++;
  box.put('runCount', runCount);

  if (runCount == 1) {
    mainText = "This is the first run";
  } else {
    mainText = "This is NOT the first run";
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
            AnimatedCalendar(),
            SizedBox(height: 30),
            buildMainText(),
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
}
