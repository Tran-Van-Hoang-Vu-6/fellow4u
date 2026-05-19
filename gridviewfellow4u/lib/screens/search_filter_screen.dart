import 'package:flutter/material.dart';

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 450,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Filters",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          const Text("Date"),

          const TextField(
            decoration: InputDecoration(
              hintText: "mm/dd/yy",
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),

          const SizedBox(height: 20),

          const Text("Guide's Language"),

          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            children: const [
              Chip(label: Text("Vietnamese")),
              Chip(label: Text("English")),
              Chip(label: Text("Korean")),
              Chip(label: Text("Spanish")),
              Chip(label: Text("French")),
            ],
          ),

          const SizedBox(height: 20),

          const Text("Fee"),

          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.attach_money),
              hintText: "\$/hour",
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C1A2),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("APPLY FILTERS"),
            ),
          ),
        ],
      ),
    );
  }
}
