import 'package:flutter/material.dart';

class nasa extends StatelessWidget {
  const nasa({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Rent a Planet!',
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Expanded(child: InputBox(label: "Planet")),
              const Expanded(child: InputBox(label: "Desire")),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Search')),
          Text("OR"),
          ElevatedButton(onPressed: () {}, child: const Text('Browse Cataloge')),
          SizedBox(height: 150),
        ],
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final String label;
  const InputBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
