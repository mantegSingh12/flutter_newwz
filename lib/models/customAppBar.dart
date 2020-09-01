import 'package:flutter/material.dart';

class CustomAppBar {
  AppBar get customAppBar {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: RichText(
        textScaleFactor: 2,
        text: TextSpan(
          text: 'Daily',
          style: TextStyle(
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic),
          children: <TextSpan>[
            TextSpan(
              text: 'Updates',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
