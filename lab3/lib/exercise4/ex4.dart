import 'dart:async';

Future<void> runExercise4() async {
  Stream<int> numbers =
  Stream.fromIterable([1, 2, 3, 4, 5]);

  final squaredNumbers = numbers.map(
        (number) => number * number,
  );

  final result = squaredNumbers.where(
        (number) => number % 2 == 0,
  );

  await result.forEach((number) {
    print(number);
  });
}

void main() async {
  await runExercise4();
}