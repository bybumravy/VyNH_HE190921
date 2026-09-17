import 'dart:async';

Future<void> runExercise3() async {
  print('===== EXERCISE 3 =====');

  print('1. Start');

  // Microtask queue.
  scheduleMicrotask(() {
    print('3. Microtask');
  });

  // Event queue.
  Future(() {
    print('4. Future event');
  });

  print('2. End');

  // Give queued asynchronous callbacks time to execute.
  await Future.delayed(Duration.zero);
}