import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Settings"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yoo Jin",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text("Traveler", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),

                Text("EDIT PROFILE", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),

          const ListTile(
            leading: Icon(Icons.language),
            title: Text("Languages"),
          ),

          const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Payment"),
          ),

          const ListTile(
            leading: Icon(Icons.security),
            title: Text("Privacy & Policies"),
          ),

          const ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
          ),

          const ListTile(leading: Icon(Icons.menu_book), title: Text("Usage")),

          const SizedBox(height: 20),

          const Center(child: Text("Sign out")),
        ],
      ),
    );
  }
}
