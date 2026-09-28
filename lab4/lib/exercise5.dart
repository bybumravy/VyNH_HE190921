import 'package:flutter/material.dart';

class DebugFixesDemo extends StatefulWidget {
  const DebugFixesDemo({super.key});

  @override
  State<DebugFixesDemo> createState() => _DebugFixesDemoState();
}

class _DebugFixesDemoState extends State<DebugFixesDemo> {
  int _counter = 0;
  DateTime? _date;
  final _movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

  void _addCount() {
    setState(() => _counter++);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _date = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Fixes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Correct ListView inside Column using\nExpanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // dùng Expanded để fix lỗi unbounded height
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.movie, color: Colors.black54),
                    title: Text(_movies[i], style: const TextStyle(fontSize: 16)),
                  );
                },
              ),
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _addCount,
                  child: Text('Count: $_counter'),
                ),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: Text(
                    _date == null
                        ? 'Pick Date'
                        : '${_date!.day}/${_date!.month}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}