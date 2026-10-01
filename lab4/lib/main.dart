import 'package:flutter/material.dart';
import 'exercise1.dart';
import 'exercise2.dart';
import 'exercise3.dart';
import 'exercise4.dart';
import 'exercise5.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatefulWidget {  
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 – Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: MainMenuScreen(
        onThemeChanged: _toggleTheme,
        currentThemeMode: _themeMode,
      ),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode currentThemeMode;

  const MainMenuScreen({
    super.key,
    required this.onThemeChanged,
    required this.currentThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _menuItem(context, 'Exercise 1 – Core Widgets', const CoreWidgetsDemo()),
          _menuItem(context, 'Exercise 2 – Input Controls', const InputControlsDemo()),
          _menuItem(context, 'Exercise 3 – Layout Demo', const LayoutBasicsDemo()),
          _menuItem(
            context,
            'Exercise 4 – App Structure & Theme',
            AppStructureDemo(
              onThemeChanged: onThemeChanged,
              isDark: currentThemeMode == ThemeMode.dark,
            ),
          ),
          _menuItem(context, 'Exercise 5 – Common UI Fixes', const DebugFixesDemo()),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget screen) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
      ),
    );
  }
}