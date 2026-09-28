import 'package:flutter/material.dart';

class AppStructureDemo extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final bool isDark;

  const AppStructureDemo({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          Row(
            children: [
              const Text('Dark', style: TextStyle(fontSize: 14)),
              Switch(value: isDark, onChanged: onThemeChanged),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: const Center(
        child: Text(
          'This is a simple screen with theme toggle.',
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onThemeChanged(!isDark),
        child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}