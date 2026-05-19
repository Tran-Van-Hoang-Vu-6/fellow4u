import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("My Trips", style: TextStyle(color: Colors.black)),

        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(6),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,

          tabs: const [
            Tab(text: "Current Trips"),
            Tab(text: "Next Trips"),
            Tab(text: "Past Trips"),
            Tab(text: "Wish List"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          _tripList(),
          _tripList(),
          _tripList(),
          const Center(child: Text("Wish List Empty")),
        ],
      ),
    );
  }

  /// LIST TRIPS
  Widget _tripList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _tripCard(
          image: "assets/images/hoguom.jpg",
          title: "Ho Guom Trip",
          location: "Hanoi, Vietnam",
          date: "Feb 2, 2020",
          time: "8:00 - 10:00",
          user: "Emmy",
          avatar: "assets/images/EM.jpg",
        ),

        const SizedBox(height: 16),

        _tripCard(
          image: "assets/images/hcm.jpg",
          title: "Ho Chi Minh Mausoleum",
          location: "Hanoi, Vietnam",
          date: "Feb 2, 2020",
          time: "8:00 - 10:00",
          user: "Tuan Tran",
          avatar: "assets/images/EM.jpg",
        ),
      ],
    );
  }

  /// TRIP CARD
  Widget _tripCard({
    required String image,
    required String title,
    required String location,
    required String date,
    required String time,
    required String user,
    required String avatar,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      elevation: 3,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),

            child: Stack(
              children: [
                Image.asset(
                  image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 10,
                  right: 10,

                  child: Container(
                    padding: const EdgeInsets.all(6),

                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(Icons.more_horiz, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          /// INFO
          Padding(
            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// LOCATION
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                  ],
                ),

                Text(location, style: const TextStyle(color: Colors.grey)),

                const SizedBox(height: 6),

                /// TITLE
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                /// DATE + TIME
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 5),

                    Text(date),

                    const SizedBox(width: 20),

                    const Icon(Icons.access_time, size: 16, color: Colors.grey),

                    const SizedBox(width: 5),

                    Text(time),
                  ],
                ),

                const SizedBox(height: 10),

                /// USER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(avatar),
                        ),

                        const SizedBox(width: 8),

                        Text(user),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: const Text("Waiting"),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    _actionButton("Detail", Icons.info, user),
                    _actionButton("Chat", Icons.chat, user),
                    _actionButton("Pay", Icons.payment, user),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// BUTTON ACTION
  Widget _actionButton(String text, IconData icon, String user) {
    return OutlinedButton.icon(
      onPressed: () {
        if (text == "Chat") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ChatDetailScreen(name: user)),
          );
        }
      },

      icon: Icon(icon, size: 18, color: Colors.teal),

      label: Text(
        text,
        style: const TextStyle(color: Color.fromARGB(255, 0, 150, 82)),
      ),
    );
  }
}
