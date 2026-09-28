import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to Flutter UI',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Icon
            const Icon(Icons.movie, size: 80, color: Colors.blue),
            const SizedBox(height: 24),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/400/200?grayscale',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) {
                  return Container(
                    height: 200,
                    color: Colors.grey.shade300,
                    child: const Center(child: Text('Không tải được ảnh')),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Card + ListTile
            Card(
              color: const Color(0xFFF2F0F7),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.black54),
                title: Text(
                  'Movie Item',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('This is a sample ListTile inside a\nCard.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}