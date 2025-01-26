import 'package:flutter/material.dart';

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
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
        ),
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Column(
            children: [
              // Responsive logo container
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: Container(
                    width: screenWidth * 0.5, // 50% of screen width
                    height: screenHeight * 0.2, // 20% of screen height
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/storefront_logo2.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              // Google Auth Button
              const GoogleAuth(),

              const SizedBox(height: 10),

              // Responsive Signup Form
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * 0.03, // 10% of screen width for padding
                  ),
                  child: const SignupForm(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
