import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: Column(
          children: [
            /// BANNER
            Stack(
              children: [
                Image.asset(
                  "assets/images/dana.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                const Positioned(
                  left: 20,
                  bottom: 20,
                  child: Text(
                    "Chat",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white54,
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ],
            ),

            /// SEARCH BOX
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Chat",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            /// CHAT LIST
            Expanded(
              child: ListView(
                children: [
                  _chatItem(
                    context,
                    "Tuan Tran",
                    "It's a beautiful place",
                    "10:30 AM",
                    "assets/images/TT.jpg",
                    0,
                  ),

                  _chatItem(
                    context,
                    "Emmy",
                    "We can start at 8am",
                    "10:30 AM",
                    "assets/images/EM.jpg",
                    2,
                  ),

                  _chatItem(
                    context,
                    "Khai Ho",
                    "See you tomorrow",
                    "11:30 AM",
                    "assets/images/KH.jpg",
                    0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CHAT ITEM
  Widget _chatItem(
    BuildContext context,
    String name,
    String message,
    String time,
    String avatar,
    int unread,
  ) {
    return ListTile(
      leading: CircleAvatar(radius: 25, backgroundImage: AssetImage(avatar)),

      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

      subtitle: Text(message),

      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 5),

          if (unread > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unread.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatDetailScreen(name: name)),
        );
      },
    );
  }
}
