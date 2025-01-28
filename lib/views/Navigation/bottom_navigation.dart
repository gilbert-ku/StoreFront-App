import 'package:flutter/material.dart';
import 'package:storefront/views/explore/explore_screen.dart';
import 'package:storefront/views/favorites/favorites_screen.dart';
import 'package:storefront/views/home/home_page.dart';
import 'package:storefront/views/profile/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentPageIndex = 0;

   // List of screens to navigate to
  final List<Widget> screens = [
    
    const Homepage(),
    const ExploreScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // current page is homepage
      body: screens[currentPageIndex],

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.pink,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white,),
            icon: Icon(Icons.home_outlined, color: Colors.purple,),
            label: 'Home',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Colors.white,),
            icon: Icon(Icons.search_outlined, color: Colors.purple,),
            label: 'Explore',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.favorite, color: Colors.white,),
            icon: Icon(Icons.favorite_outlined, color: Colors.purple,),
            label: 'Favorite',
          ),

          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.white,),
            icon: Icon(Icons.person_outline_outlined, color: Colors.purple,),
            label: 'Person',
          ),
        ],
      ),
    );
  }
}
