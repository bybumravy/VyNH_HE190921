import 'dart:async';

void runExercise4() {
  Stream<int> numbers =
  Stream.fromIterable([1, 2, 3, 4, 5]);

  final squaredNumbers = numbers.map(
        (number) => number * number,
  );

  final result = squaredNumbers.where(
        (number) => number % 2 == 0,
  );

  result.listen((number) {
    print(number);
  });
}

void main()  {
  runExercise4();
}
