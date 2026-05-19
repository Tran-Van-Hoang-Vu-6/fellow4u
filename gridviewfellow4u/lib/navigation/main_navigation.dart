import 'package:flutter/material.dart';

import '../screens/explore_screen.dart';
import '../screens/search_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/my_trips_screen.dart';
import '../screens/guide_screen.dart';
import '../screens/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;

  final List<Widget> pages = const [
    ExploreScreen(),
    SearchScreen(),
    ChatScreen(),
    MyTripsScreen(),
    GuideScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: const Color(0xFF00CEA6),
        unselectedItemColor: Colors.grey,

        onTap: (value) {
          setState(() {
            index = value;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Trips",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Guide"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
