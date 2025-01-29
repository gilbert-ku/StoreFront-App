import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
      ),
      child: Stack(
        children: [
          // Image Positioned to the Right
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 250,
              width: 250,
              child: Image.asset(
                'assets/images/storefront_app_hero.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text Positioned in the Center
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: 300,
                child: Column(children: [
                  Text(
                    "Your One-Stop Shop.",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child:  Text(
                          "Shop Now", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
