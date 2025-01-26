import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:storefront/services/email_auth_services.dart';
import 'package:storefront/views/auth/login_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

// email validator
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

// validate password
String? validatePassword(String value) {
  // Regular expression for strong password validation
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (value.isEmpty) {
    return 'Please enter your password';
  } else if (!regex.hasMatch(value)) {
    return 'Password must be 8+ chars, incl. upper, lower, and a num.';
  }
  return null; // Validation successful
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          key: _formKey, // unique global key

          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17.0,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // full field
                TextFormField(
                  controller: _nameController, // name controller

                  decoration: const InputDecoration(
                    labelText: "Enter Your Name",
                    hintText: "John Doe",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                  // Replace autovalidate with autovalidateMode
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 17,
                ),

                // email field
                TextFormField(
                  controller: _emailController, // email controller

                  decoration: const InputDecoration(
                    labelText: "Enter Your Email",
                    hintText: "jondoe@email.com",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                  // Replace autovalidate with autovalidateMode
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) {
                    // Safely check if input is not null and then validate
                    if (input != null && input.isValidEmail()) {
                      return null;
                    }
                    return "Please enter a valid email";
                  },
                ),
                const SizedBox(
                  height: 17,
                ),

                //  password controller
                TextFormField(
                  controller: _passwordController, //password controller

                  decoration: const InputDecoration(
                    labelText: "Enter Your Password",
                    hintText: "password",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                  ),
                  obscureText: true, // Hides the text for password input
                  validator: (value) {
                    return validatePassword(value ?? '');
                  },
                ),

                const SizedBox(
                  height: 17,
                ),

                // forgot password
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By Sign Up you agree to ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      TextSpan(
                        text: "Terms",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      TextSpan(
                        text: "Conditions",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // button
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }

                      final message = await EmailAuthServices().registration(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (message!.contains("Success")) {
                        debugPrint("account created successful");
                      } else {
                        debugPrint("error ");
                      }
                      // debugPrint(
                      //     'Email: ${_emailController.text}, Password: ${_passwordController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors
                          .transparent, // Makes the button background transparent
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
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
                ),

                const SizedBox(
                  height: 10,
                ),

                // const Text("Don't have an account?,", )
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "You have an account?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: "  Sign In.",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.pink,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap event
                             Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                      ),
                    ],
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
