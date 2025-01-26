import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Favorites page",
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
