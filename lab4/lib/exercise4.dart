import 'package:flutter/material.dart';

class AppStructureDemo extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const AppStructureDemo({
    super.key,
    required this.onThemeChanged,
  });

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  bool _isDark = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isDark = Theme.of(context).brightness == Brightness.dark;
  }

  void _toggleTheme(bool value) {
    setState(() => _isDark = value);
    widget.onThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          Row(
            children: [
              const Text('Dark'),
              Switch(value: _isDark, onChanged: _toggleTheme),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text('This is a simple screen with theme toggle.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _toggleTheme(!_isDark),
        child: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}