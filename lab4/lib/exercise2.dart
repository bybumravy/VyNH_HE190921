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
              title: const Text('Is movie active?'),
              value: _isActive,
              onChanged: (val) => setState(() => _isActive = val),
            ),
            const SizedBox(height: 16),

            // Radio
            const Text(
              'Genre (RadioListTile)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioGroup<Genre>(
              groupValue: _genre,
              onChanged: (val) => setState(() => _genre = val ?? Genre.none),
              child: Column(
                children: const [
                  RadioListTile<Genre>(
                    title: Text('Action'),
                    value: Genre.action,
                  ),
                  RadioListTile<Genre>(
                    title: Text('Comedy'),
                    value: Genre.comedy,
                  ),
                ],
              ),
            ),
            Text('Selected genre: ${_genre.name}'),
            const SizedBox(height: 32),

            // Date picker button
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Open Date Picker'),
            ),
            if (_pickedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Selected Date: ${_pickedDate!.day}/${_pickedDate!.month}/${_pickedDate!.year}',
                ),
              ),
          ],
        ),
      ),
    );
  }
}