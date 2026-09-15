// Exercise 3: Control Flow & Functions

void main() {
  double score = 8.5;

  // Sử dụng if/else để xếp loại điểm.
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

  // Sử dụng switch để xác định ngày trong tuần.
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

  // Vòng lặp for sử dụng chỉ số.
  print('\nUsing for loop:');

  for (int index = 0; index < courses.length; index++) {
    print('Course ${index + 1}: ${courses[index]}');
  }

  // Vòng lặp for-in lấy trực tiếp từng phần tử.
  print('\nUsing for-in loop:');

  for (String course in courses) {
    print(course);
  }

  // forEach gọi một hàm cho từng phần tử.
  print('\nUsing forEach:');

  courses.forEach((course) {
    print(course);
  });

  // Gọi hàm thông thường.
  int total = addNumbers(10, 20);
  print('\n10 + 20 = $total');

  // Gọi arrow function.
  print('Square of 5 = ${square(5)}');
}

// Hàm thông thường.
int addNumbers(int firstNumber, int secondNumber) {
  return firstNumber + secondNumber;
}

// Arrow function.
int square(int number) => number * number;