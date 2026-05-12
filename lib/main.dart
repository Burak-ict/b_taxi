import 'package:flutter/material.dart';
import 'features/passenger/presentation/pages/landing_page.dart';

void main() {
  runApp(const BTaxiApp());
}

class BTaxiApp extends StatelessWidget {
  const BTaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}