import 'package:animator/screens/home_screen.dart';
import 'package:animator/screens/planet_detail.dart';
import 'package:animator/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(color: MyColors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        'detail': (context) => const PlanetDetails(),
      },
    ),
  );
}