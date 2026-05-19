import 'package:flutter/material.dart';

class ToursMoreScreen extends StatelessWidget {
  const ToursMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          tourCard(
            "Da Nang - Ba Na - Hoi An",
            "\$400.00",
            "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
          ),

          const SizedBox(height: 20),

          tourCard(
            "Melbourne - Sydney",
            "\$600.00",
            "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
          ),

          const SizedBox(height: 20),

          tourCard(
            "Hanoi - Ha Long Bay",
            "\$300.00",
            "https://images.unsplash.com/photo-1528127269322-539801943592",
          ),
        ],
      ),
    );
  }

  Widget tourCard(String title, String price, String image) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
