import 'package:flutter/material.dart';

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
        title: const Text(
          "StoreFront",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          color: Colors.pink[100],
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
