import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo on the left side
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  'assets/images/storefront_logo.png',
                  height: 40, // Logo size
                  fit: BoxFit.cover, // Fit logo within the box
                  alignment: Alignment.center,
                ),
              ),

              // Cart icon on the right side
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.cartShopping,
                  size: 25, // Icon size
                  color: Colors.pink, // Icon color
                ),
                onPressed: () {
                  // Define the behavior when the cart icon is tapped
                  debugPrint('Cart icon tapped');
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          color: Colors.white,
          child: const Center(
            child: Text(
              "Karibu StoreFront, your one stope Shop",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
