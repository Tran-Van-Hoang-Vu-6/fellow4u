import 'package:flutter/material.dart';

class AddJourneyScreen extends StatelessWidget {
  const AddJourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Add Journey"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("DONE", style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: "Name")),

            const SizedBox(height: 20),

            TextField(decoration: const InputDecoration(labelText: "Location")),

            const SizedBox(height: 30),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text("Upload Photos"),
            ),
          ],
        ),
      ),
    );
  }
}
