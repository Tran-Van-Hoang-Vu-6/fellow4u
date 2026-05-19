import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'navigation/main_navigation.dart';
import 'screens/search_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/guides_more_screen.dart';
import 'screens/tours_more_screen.dart';

void main() {
  runApp(const Fellow4UApp());
}

class Fellow4UApp extends StatelessWidget {
  const Fellow4UApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fellow4U",

      initialRoute: "/login",

      routes: {
        /// AUTH
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),

        /// MAIN APP
        "/home": (context) => const MainNavigation(),

        /// FEATURE
        "/search": (context) => const SearchScreen(),
        "/booking": (context) => const BookingScreen(),
        "/payment": (context) => const PaymentScreen(),

        /// MORE PAGES
        "/guides-more": (context) =>
            const GuidesMoreScreen(bannerImage: "assets/images/banner.jpg"),
        "/tours-more": (context) => const ToursMoreScreen(),
      },
    );
  }
}
