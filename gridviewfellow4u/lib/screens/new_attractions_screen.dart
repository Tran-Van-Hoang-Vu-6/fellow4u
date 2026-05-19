import 'package:flutter/material.dart';
import 'add_place_screen.dart';

class NewAttractionsScreen extends StatelessWidget {
  const NewAttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List places = ["Cong Coffee", "Cong Hoa Market", "Cong Cho", "Cong Church"];

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Cong",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddPlaceScreen(),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(places[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
