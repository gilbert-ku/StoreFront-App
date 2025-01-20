import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.black, // Color of the line
                    thickness: 1, // Thickness of the line
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Or Login with Email",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.black, // Color of the line
                    thickness: 1, // Thickness of the line
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17.0,
              vertical: 10,
            ),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Your Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Your Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 17,
                ),

                // forgot password
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.pink,
                        Colors.purple,
                      ],
                      stops: [0.0, 1.0],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0, // Removes shadow
                      backgroundColor: Colors
                          .transparent, // Makes the button background transparent
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Matches the container's border radius
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
