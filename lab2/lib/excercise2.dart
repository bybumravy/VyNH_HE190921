// Exercise 2: Collections & Operators

void main() {
  // List là danh sách có thứ tự và có thể chứa giá trị trùng nhau.
  List<int> numbers = [10, 20, 30, 40];

  print('Original list: $numbers');

  // Truy cập phần tử đầu tiên bằng chỉ số 0.
  print('First number: ${numbers[0]}');

  // Thêm và xóa phần tử.
  numbers.add(50);
  print('After adding 50: $numbers');

  numbers.remove(20);
  print('After removing 20: $numbers');

  // Toán tử cộng và trừ.
  int addition = numbers[0] + numbers[1];
  int subtraction = numbers[2] - numbers[0];

  print('Addition result: $addition');
  print('Subtraction result: $subtraction');

  // Toán tử so sánh ==.
  bool isEqual = numbers[0] == 10;
  print('First number equals 10: $isEqual');

  // Toán tử logic &&.
  bool isValid = numbers.isNotEmpty && numbers.length >= 3;
  print('List is valid: $isValid');

  // Toán tử ba ngôi ? :.
  String listType = numbers.length >= 4 ? 'Long list' : 'Short list';
  print('List type: $listType');

  // Set chỉ giữ các giá trị duy nhất.
  Set<String> subjects = {'Dart', 'Flutter', 'Dart'};

  print('Original set: $subjects');

  subjects.add('Java');
  subjects.remove('Flutter');

  print('Updated set: $subjects');

  // Map lưu dữ liệu theo dạng key-value.
  Map<String, dynamic> student = {
    'name': 'Nguyen Ha Vy',
    'age': 20,
    'score': 8.5,
  };

  // Truy cập giá trị trong Map bằng key.
  print('Student name: ${student['name']}');
  print('Student score: ${student['score']}');

  // Thêm và xóa phần tử trong Map.
  student['major'] = 'Information Technology';
  student.remove('age');

  print('Updated map: $student');
}