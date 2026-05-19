import 'package:flutter/material.dart';

class TourDetailScreen extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const TourDetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER IMAGE
            Stack(
              children: [
                Image.asset(
                  image,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                Positioned(
                  top: 40,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {
                          _showShare(context);
                        },
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.favorite_border, color: Colors.white),
                      const SizedBox(width: 8),
                      const Icon(Icons.bookmark_border, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),

            /// MAIN CONTENT
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + PRICE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xFF00C1A2),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// RATING
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 6),
                      Text("145 Reviews"),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// PROVIDER
                  const Row(
                    children: [
                      Text("Provider "),
                      Text(
                        "dulichviet",
                        style: TextStyle(color: Color(0xFF00C1A2)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// SUMMARY
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),

                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Summary",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text("Itinerary"),
                        Text("Da Nang - Ba Na - Hoi An"),

                        SizedBox(height: 10),

                        Text("Duration"),
                        Text("2 days, 2 nights"),

                        SizedBox(height: 10),

                        Text("Departure Date"),
                        Text("Feb 12"),

                        SizedBox(height: 10),

                        Text("Departure Place"),
                        Text("Ho Chi Minh"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// SCHEDULE
                  const Text(
                    "Schedule",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  scheduleItem("6:00AM"),
                  scheduleItem("10:00AM"),
                  scheduleItem("1:00PM"),
                  scheduleItem("8:00PM"),

                  const SizedBox(height: 20),

                  /// PRICE TABLE
                  const Text(
                    "Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                      children: const [
                        ListTile(
                          title: Text("Adult (>10 years old)"),
                          trailing: Text("\$400.00"),
                        ),
                        Divider(height: 1),
                        ListTile(
                          title: Text("Child (5 - 10 years old)"),
                          trailing: Text("\$320.00"),
                        ),
                        Divider(height: 1),
                        ListTile(
                          title: Text("Child (<5 years old)"),
                          trailing: Text("Free"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// BOOK BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00C1A2),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),

                      onPressed: () {
                        Navigator.pushNamed(context, "/booking");
                      },

                      child: const Text("BOOK THIS TOUR"),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SCHEDULE ITEM
  static Widget scheduleItem(String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 10, color: Color(0xFF00C1A2)),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF00C1A2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Lorem ipsum is simply dummy text of the printing industry.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// SHARE MODAL
  void _showShare(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 160,

          child: Column(
            children: [
              const Text("Share on", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.facebook, size: 32, color: Colors.blue),
                  Icon(Icons.email, size: 32, color: Colors.red),
                  Icon(Icons.message, size: 32, color: Colors.green),
                  Icon(Icons.share, size: 32, color: Colors.lightBlue),
                ],
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
    );
  }
}
