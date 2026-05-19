import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  final String name;

  const ChatDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(name, style: const TextStyle(color: Colors.black)),
      ),

      body: Column(
        children: [
          /// CHAT LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _leftBubble("hi, this is Emmy"),

                _leftBubble(
                  "It is a long established fact that a reader will be distracted",
                ),

                const SizedBox(height: 10),

                _rightBubble("as opposed to using 'Content here'"),

                _rightBubble("There are many variations of passages"),
              ],
            ),
          ),

          /// MESSAGE INPUT
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.white,

            child: Row(
              children: [
                const Icon(Icons.mic, color: Colors.grey),

                const SizedBox(width: 8),

                const Icon(Icons.image, color: Colors.grey),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                const Icon(Icons.send, color: Color(0xFF00CEA6)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// LEFT MESSAGE
  Widget _leftBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF00CEA6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  /// RIGHT MESSAGE
  Widget _rightBubble(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }
}
