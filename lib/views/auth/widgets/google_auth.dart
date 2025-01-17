import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../services/auth_service.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({super.key});

  @override
  GoogleAuthState createState() => GoogleAuthState();
}

class GoogleAuthState extends State<GoogleAuth> {
  bool _isSigningIn = false; // Track sign-in progress

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isSigningIn = true; // Show loading indicator
    });

    final authService = AuthService();
    final userCredential = await authService.signInWithGoogle(context);

    setState(() {
      _isSigningIn = false; // Hide loading indicator after sign-in
    });

    if (userCredential != null) {
      // Sign-in successful, handle navigation or success actions
      // For example: navigate to the home screen
      // Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sign-in with Google button
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                // color: Colors.pink, // Use theme color
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.pink,
                    Colors.purple,
                  ],
                  stops: [0.0, 1.0],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated,
                ),
              ),

              // elevated btn
              child: Padding(
                padding: const EdgeInsets.all(
                  3.0,
                ),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 15,
                    ),
                  ),
                  onPressed: _isSigningIn
                      ? null
                      : _signInWithGoogle, // Disable while signing in
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      _isSigningIn ? 'Signing in...' : 'Sign in with Google',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  icon: _isSigningIn
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        ) // Show loading indicator
                      : const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
