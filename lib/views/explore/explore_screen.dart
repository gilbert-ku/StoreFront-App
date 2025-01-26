import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Explore page",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(
            249,
            221,
            0,
            250,
          ),
        ),
      ),
    );
  }
}