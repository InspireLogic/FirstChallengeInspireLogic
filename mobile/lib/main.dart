import 'package:challenge_inspire_logic/views/HomePage.dart';
import 'package:challenge_inspire_logic/views/pages/InitialPage.dart';
import 'package:challenge_inspire_logic/views/pages/LodgingsPage.dart';
import 'package:challenge_inspire_logic/views/pages/LoginPage.dart';

import 'package:challenge_inspire_logic/views/pages/CountryResortsPage.dart';
import 'package:challenge_inspire_logic/views/pages/ResortsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arctic Travels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const Initialpage(),
        '/home': (context) => HomePage(),
        '/initial': (context) => Initialpage(),
        '/login': (context) => Loginpage(),
        '/regions': (context) => CountryResortsPage(),
        '/lodgings': (context) => LodgingsPage(),
        '/resorts': (context) => CountryResortsPage(),
        '/passes': (context) => CountryResortsPage(),
      },
    );
  }
}
