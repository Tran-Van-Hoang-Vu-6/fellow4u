import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'add_photos_screen.dart';
import 'my_journeys_screen.dart';
import '../widgets/photo_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  "https://picsum.photos/600/300",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  right: 20,
                  top: 40,
                  child: IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const Positioned(
                  left: 20,
                  bottom: -35,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            const Text(
              "Yoo Jin",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const Text(
              "yoojin@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// MY PHOTOS
            ListTile(
              title: const Text(
                "My Photos",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddPhotosScreen()),
                );
              },
            ),

            /// PHOTO GRID WIDGET
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PhotoGrid(
                images: [
                  "https://picsum.photos/200?1",
                  "https://picsum.photos/200?2",
                  "https://picsum.photos/200?3",
                  "https://picsum.photos/200?4",
                  "https://picsum.photos/200?5",
                  "https://picsum.photos/200?6",
                ],
              ),
            ),

            /// MY JOURNEYS
            ListTile(
              title: const Text(
                "My Journeys",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyJourneysScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
