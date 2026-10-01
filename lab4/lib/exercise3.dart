import 'package:flutter/material.dart';

class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {'title': 'Avatar', 'letter': 'A'},
      {'title': 'Inception', 'letter': 'I'},
      {'title': 'Interstellar', 'letter': 'I'},
      {'title': 'Joker', 'letter': 'J'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: movies.length,
              itemBuilder: (ctx, i) {
                final m = movies[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(m['letter']!),
                    ),
                    title: Text(m['title']!),
                    subtitle: const Text('Sample description'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}