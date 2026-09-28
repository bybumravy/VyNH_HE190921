import 'package:flutter/material.dart';

enum Genre { none, action, comedy }

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _sliderVal = 50.0;
  bool _isActive = true;
  Genre _genre = Genre.none;
  DateTime? _pickedDate;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _pickedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slider
            const Text(
              'Rating (Slider)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _sliderVal,
              min: 0,
              max: 100,
              activeColor: Colors.indigo.shade400,
              onChanged: (val) => setState(() => _sliderVal = val),
            ),
            Text('Current value: ${_sliderVal.round()}'),
            const SizedBox(height: 24),

            // Switch
            const Text(
              'Active (Switch)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Is movie active?'),
              value: _isActive,
              activeColor: Colors.indigo.shade400,
              onChanged: (val) => setState(() => _isActive = val),
            ),
            const SizedBox(height: 16),

            // Radio
            const Text(
              'Genre (RadioListTile)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile<Genre>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Action'),
              value: Genre.action,
              groupValue: _genre,
              onChanged: (val) => setState(() => _genre = val!),
            ),
            RadioListTile<Genre>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Comedy'),
              value: Genre.comedy,
              groupValue: _genre,
              onChanged: (val) => setState(() => _genre = val!),
            ),
            Text('Selected genre: ${_genre.name}'),
            const SizedBox(height: 32),

            // Date picker button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F0F7),
                  foregroundColor: Colors.indigo.shade600,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: _pickDate,
                child: const Text('Open Date Picker', style: TextStyle(fontSize: 16)),
              ),
            ),
            if (_pickedDate != null) ...[
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Selected Date: ${_pickedDate!.day}/${_pickedDate!.month}/${_pickedDate!.year}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}