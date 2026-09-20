void main() {
  double score = 8.5;

  if (score >= 8.0) {
    print('Grade: Excellent');
  } else if (score >= 6.5) {
    print('Grade: Good');
  } else if (score >= 5.0) {
    print('Grade: Average');
  } else {
    print('Grade: Failed');
  }

  int day = 2;
  switch (day) {
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    case 4:
      print('Thursday');
      break;
    case 5:
      print('Friday');
      break;
    case 6:
      print('Saturday');
      break;
    case 7:
      print('Sunday');
      break;
    default:
      print('Invalid day');
  }

  List<String> courses = [
    'Dart',
    'Flutter',
    'Mobile Development',
  ];
  print("");
  for (int i = 0; i < courses.length; i++) {
    print('Course ${i + 1}: ${courses[i]}');
  }
  for (String c in courses) {
    print(c);
  }
  print("***For each****");
  courses.forEach((c) {
    print(c);
  });

  int total = addNumbers(10, 20);
  print('10 + 20 = $total');
  print('Square of 5 = ${square(5)}');
}

int addNumbers(int firstNumber, int secondNumber) {
  return firstNumber + secondNumber;
}

int square(int number) => number * number;