import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storefront/views/auth/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log in",
          style: GoogleFonts.nunito(
            textStyle:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric( vertical: 17.0),
              child: Container(
                width: 200,
                height: 150,
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/storefront_logo2.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          const LoginForm()
        ],
      ),
    );
  }
}
