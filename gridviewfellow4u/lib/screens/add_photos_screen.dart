import 'package:flutter/material.dart';

class AddPhotosScreen extends StatefulWidget {
  const AddPhotosScreen({super.key});

  @override
  State<AddPhotosScreen> createState() => _AddPhotosScreenState();
}

class _AddPhotosScreenState extends State<AddPhotosScreen> {
  List<bool> selected = List.generate(9, (i) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Add Photos"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("DONE", style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),

        itemCount: 9,

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected[index] = !selected[index];
              });
            },

            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    "https://picsum.photos/200?random=$index",
                    fit: BoxFit.cover,
                  ),
                ),

                if (selected[index])
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(Icons.check_circle, color: Colors.teal),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
