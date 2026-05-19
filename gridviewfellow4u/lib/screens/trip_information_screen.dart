import 'package:flutter/material.dart';

/// =============================
/// TRIP INFORMATION SCREEN
/// =============================

class TripInformationScreen extends StatefulWidget {
  const TripInformationScreen({super.key});

  @override
  State<TripInformationScreen> createState() => _TripInformationScreenState();
}

class _TripInformationScreenState extends State<TripInformationScreen> {
  int travelers = 1;

  List<Map> attractions = [
    {"name": "Dragon Bridge", "image": "assets/images/img1.png"},
    {"name": "Marble Mountains", "image": "assets/images/img2.png"},
    {"name": "My Khe Beach", "image": "assets/images/img3.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: const Icon(Icons.close, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Trip Information",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// DATE
            const Text("Date"),

            const TextField(
              decoration: InputDecoration(
                hintText: "mm/dd/yy",
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),

            const SizedBox(height: 20),

            /// TIME
            const Text("Time"),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "From",
                      suffixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "To",
                      suffixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// CITY
            const Text("City"),

            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                hintText: "Danang",
              ),
            ),

            const SizedBox(height: 20),

            /// TRAVELERS
            const Text("Number of travelers"),

            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (travelers > 1) {
                      setState(() {
                        travelers--;
                      });
                    }
                  },
                ),

                Text(
                  travelers.toString(),
                  style: const TextStyle(fontSize: 18),
                ),

                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      travelers++;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ATTRACTIONS
            const Text("Attractions"),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                /// ADD NEW BUTTON
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewAttractionScreen(),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        attractions.add(result);
                      });
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text("+ Add New")),
                  ),
                ),

                /// LIST ATTRACTIONS
                ...attractions.map((a) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          a["image"],
                          width: 120,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const Positioned(
                        right: 5,
                        top: 5,
                        child: Icon(Icons.check_circle, color: Colors.green),
                      ),

                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Text(
                          a["name"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),

            const Spacer(),

            /// DONE BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C1A2),
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text("DONE"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =============================
/// NEW ATTRACTIONS SCREEN
/// =============================

class NewAttractionScreen extends StatefulWidget {
  const NewAttractionScreen({super.key});

  @override
  State<NewAttractionScreen> createState() => _NewAttractionScreenState();
}

class _NewAttractionScreenState extends State<NewAttractionScreen> {
  final TextEditingController controller = TextEditingController();

  List<String> suggestions = [
    "Cong Coffee",
    "Cong Hoa Market",
    "Cong Cho",
    "Cong Church",
  ];

  List<String> filtered = [];

  bool showResult = false;

  @override
  void initState() {
    super.initState();
    filtered = suggestions;
  }

  void search(String value) {
    setState(() {
      filtered = suggestions
          .where((e) => e.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void selectPlace(String place) {
    setState(() {
      showResult = true;
      filtered.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),

                  const Text(
                    "New Attractions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, {
                        "name": "Cong Coffee",
                        "image": "assets/images/cong.jpg",
                      });
                    },
                    child: const Text(
                      "DONE",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// SEARCH BOX
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(blurRadius: 6, color: Colors.black12),
                  ],
                ),

                child: TextField(
                  controller: controller,
                  onChanged: search,
                  decoration: const InputDecoration(
                    hintText: "Type a Place",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// SUGGESTIONS
              if (filtered.isNotEmpty && !showResult)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filtered.length,

                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filtered[index]),
                        onTap: () => selectPlace(filtered[index]),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 20),

              /// RESULT CARD
              if (showResult)
                Stack(
                  children: [
                    Container(
                      width: 180,
                      height: 110,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/cong.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),

                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(10),

                      child: const Text(
                        "Cong Coffee",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Positioned(
                      top: 6,
                      right: 6,
                      child: Icon(Icons.check_circle, color: Colors.green),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
