import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storefront/firebase_options.dart';
// import 'package:storefront/views/auth/login_screen.dart';
import 'package:storefront/views/auth/signup_screen.dart';
// import 'package:storefront/views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initializes Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          bodySmall: GoogleFonts.nunito(),
          bodyMedium: GoogleFonts.nunito(),
          bodyLarge: GoogleFonts.nunito(),
        ),
      ),

      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ], // Add analytics observer
      // home: const MyHomePage(),
      // home: const Homepage()
      // home: const LoginScreen(),
      home:  const SignupScreen(),
    );
  }
}
