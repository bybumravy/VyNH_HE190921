void main() {
  List<int> numbers = [10, 10, 20, 30, 40];
  print('Original list: $numbers');
  print('First number: ${numbers[0]}');
  numbers.add(50);
  print('After adding 50: $numbers');
  numbers.remove(20);
  print('After removing 20: $numbers');
  int addition = numbers[0] + numbers[1];
  int subtraction = numbers[2] - numbers[0];
  print('Addition result: $addition');
  print('Subtraction result: $subtraction');
  bool isEqual = numbers[0] == 10;
  print('First number equals 10: $isEqual');

  Set<String> subjects = {'Dart', 'Flutter', 'Dart'};
  print('Original set: $subjects');
  subjects.add('Java');
  subjects.remove('Flutter');
  print('Updated set: $subjects');

  Map<String, dynamic> student = {
    'name': 'Nguyen Ha Vy',
    'age': 21,
    'score': 8.5,
  };

  print('Student name: ${student['name']}');
  print('Student score: ${student['score']}');

  student['major'] = 'Software Engineer';
  student.remove('age');

  print('Updated map: $student');
}