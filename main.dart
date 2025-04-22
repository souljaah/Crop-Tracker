// lib/main.dart

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'crop_records_page.dart';
import 'income_records_page.dart';
import 'onboarding_screen.dart';
import 'splash_screen.dart'; // 👈 Import the splash screen

void main() {
  runApp(CropTrackerApp());
}

class CropTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crop Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/', // 👈 This will now point to SplashScreen
      routes: {
        '/': (context) => SplashScreen(), // 👈 Use SplashScreen as the root
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => HomePage(),
        '/crop-records': (context) => CropRecordsPage(),
        '/income-records': (context) => IncomeRecordsPage(),
      },
    );
  }
}
