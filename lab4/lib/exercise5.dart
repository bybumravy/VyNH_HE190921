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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Fix 1: ListView inside Column dùng Expanded ---
            const Text(
              'Fix 1: ListView in Column using Expanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Dùng SizedBox với chiều cao cố định thay vì Expanded
            // vì bên ngoài là SingleChildScrollView (không có bounded height)
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    leading: const Icon(Icons.movie),
                    title: Text(_movies[i]),
                  );
                },
              ),
            ),

            const Divider(),

            // --- Fix 3: setState() để cập nhật state ---
            const Text(
              'Fix 3: setState() to update UI',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _addCount,
                  child: Text('Count: $_counter'),
                ),
                // --- Fix 4: DatePicker gọi từ widget tree hợp lệ ---
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