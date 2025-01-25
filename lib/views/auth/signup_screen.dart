import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:storefront/views/auth/widgets/google_auth.dart';
import 'package:storefront/views/auth/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
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
              padding: const EdgeInsets.symmetric(vertical: 17.0),
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


          const GoogleAuth(),

          const SizedBox(
            height: 10,
          ),

          const SignupForm(),
        ],
      ),
    );
  }
}
