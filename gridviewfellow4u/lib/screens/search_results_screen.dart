import 'package:flutter/material.dart';
import 'search_filter_screen.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  Widget guideCard(String name, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        const Text("Danang, Vietnam", style: TextStyle(color: Colors.green)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: const Icon(Icons.close, color: Colors.black),

        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const SearchFilterScreen(),
                isScrollControlled: true,
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Guides in Danang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .75,
              children: [
                guideCard("Tuan Tran", "assets/images/dana.jpg"),
                guideCard("Linh Hana", "assets/images/banahill.jpg"),
                guideCard("Tuan Tran", "assets/images/caurong.png"),
                guideCard("Linh Hana", "assets/images/hoian.jpg"),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Tours in Danang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/dana.png"),
            ),

            const SizedBox(height: 10),

            const Text(
              "Da Nang - Ba Na - Hoi An",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const Text(
              "\$400.00",
              style: TextStyle(
                color: Color(0xFF00C1A2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
