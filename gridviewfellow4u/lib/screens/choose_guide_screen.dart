import 'package:flutter/material.dart';
import 'trip_information_screen.dart';

class ChooseGuideScreen extends StatelessWidget {
  final String name;
  final String image;
  final String location;

  const ChooseGuideScreen({
    super.key,
    required this.name,
    required this.image,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                /// BACKGROUND
                Image.asset(
                  "assets/images/halong.jpg",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                /// BACK BUTTON
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                /// AVATAR
                Positioned(
                  bottom: -40,
                  left: 20,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(image),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            /// NAME + BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// GUIDE INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// NAME
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        /// RATING
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: 16,
                            ),
                            SizedBox(width: 6),
                            Text("127 Reviews"),
                          ],
                        ),

                        const SizedBox(height: 6),

                        /// LANGUAGE
                        const Text(
                          "Vietnamese   English   Korean",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 6),

                        /// LOCATION
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.teal,
                            ),

                            const SizedBox(width: 4),

                            Text(
                              "$location, Vietnam",
                              style: const TextStyle(color: Colors.teal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// CHOOSE BUTTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TripInformationScreen(),
                        ),
                      );
                    },

                    child: const Text("CHOOSE THIS GUIDE"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// DESCRIPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(height: 1.4),
              ),
            ),

            const SizedBox(height: 20),

            /// VIDEO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.asset(
                      image,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),

                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.teal,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// PRICE TABLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),

                child: const Column(
                  children: [
                    PriceRow("1 - 3 Travelers", "\$10/hour"),
                    Divider(height: 1),
                    PriceRow("4 - 6 Travelers", "\$14/hour"),
                    Divider(height: 1),
                    PriceRow("7 - 9 Travelers", "\$17/hour"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// EXPERIENCES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Experiences",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ExperienceCard(),
            ),

            const SizedBox(height: 25),

            /// REVIEWS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  Text("SEE MORE", style: TextStyle(color: Colors.teal)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                children: [
                  ReviewItem(
                    name: "Pena Valdez",
                    avatar: "assets/images/kth.jpg",
                  ),

                  SizedBox(height: 15),

                  ReviewItem(name: "Daehyun", avatar: "assets/images/khs.jpg"),

                  SizedBox(height: 15),

                  ReviewItem(
                    name: "Burns Marks",
                    avatar: "assets/images/bws.jpg",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class PriceRow extends StatelessWidget {
  final String title;
  final String price;

  const PriceRow(this.title, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),

      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),

            child: Image.asset(
              "assets/images/hoian.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2 Hour Bicycle Tour exploring Hoian",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 4),

                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.teal),
                    Text("Hoian, Vietnam"),
                  ],
                ),

                SizedBox(height: 4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jan 25, 2020"),

                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: Colors.teal,
                        ),
                        Text("1234 Likes"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String name;
  final String avatar;

  const ReviewItem({super.key, required this.name, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CircleAvatar(backgroundImage: AssetImage(avatar)),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const Text("Jan 22, 2020", style: TextStyle(fontSize: 12)),
                ],
              ),

              const Row(
                children: [
                  Icon(Icons.star, size: 14, color: Colors.amber),
                  Icon(Icons.star, size: 14, color: Colors.amber),
                  Icon(Icons.star, size: 14, color: Colors.amber),
                  Icon(Icons.star, size: 14, color: Colors.amber),
                  Icon(Icons.star_half, size: 14, color: Colors.amber),
                ],
              ),

              const SizedBox(height: 5),

              const Text(
                "Lorem Ipsum is simply dummy text of the printing industry.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
