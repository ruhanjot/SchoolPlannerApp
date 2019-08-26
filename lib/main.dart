import 'package:flutter/material.dart';
import './utils/constants.dart';

import './pages/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'School Planner';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        accentColor: highlightGreen,
        primaryColor: mainBlack,
        backgroundColor: accentGrey,
      ),
      home: LandingPage()
    );
  }
}
