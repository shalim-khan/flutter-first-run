import 'package:flutter/material.dart';

class AnimatedCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Image.asset(
        "images/calendar.gif",
        height: 140,
      ),
    );
  }
}
