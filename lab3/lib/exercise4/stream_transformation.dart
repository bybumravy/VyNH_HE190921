import 'dart:async';

Future<void> runExercise4() async {
  print('===== EXERCISE 4 =====');

  // Create a stream of numbers from 1 to 5.
  final numbers = Stream.fromIterable([
    1,
    2,
    3,
    4,
    5,
  ]);

  // Square every number.
  final squaredNumbers = numbers.map(
        (number) => number * number,
  );

  // Keep only even numbers.
  final result = squaredNumbers.where(
        (number) => number % 2 == 0,
  );

  // Listen to the transformed stream.
  await result.forEach((number) {
    print(number);
  });
}