import 'package:flutter/material.dart';
import 'add_journey_screen.dart';
import '../widgets/journey_card.dart';

class MyJourneysScreen extends StatelessWidget {
  const MyJourneysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Journeys")),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          /// ADD JOURNEY BUTTON
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddJourneyScreen()),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Journey"),
          ),

          const SizedBox(height: 20),

          /// JOURNEY CARD 1
          const JourneyCard(
            title: "A memory in Danang",
            location: "Danang, Vietnam",
            image: "https://picsum.photos/400/200?1",
          ),

          /// JOURNEY CARD 2
          const JourneyCard(
            title: "Sapa in spring",
            location: "Sapa, Vietnam",
            image: "https://picsum.photos/400/200?2",
          ),
        ],
      ),
    );
  }
}
