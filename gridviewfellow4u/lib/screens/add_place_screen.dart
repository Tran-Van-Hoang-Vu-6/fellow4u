import 'package:flutter/material.dart';

class AddPlaceScreen extends StatelessWidget {
  const AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Attractions"),
        centerTitle: true,
        leading: const Icon(Icons.close),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("DONE", style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Type a Place",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/cong.jpg",
                    width: 150,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),

                const Positioned(
                  right: 5,
                  top: 5,
                  child: Icon(Icons.check_circle, color: Colors.green),
                ),

                const Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text(
                    "Cong Coffee",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
