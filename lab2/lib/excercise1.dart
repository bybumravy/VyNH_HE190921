// Exercise 1: Basic Syntax & Data Types

void main() {
  // Khai báo các biến với kiểu dữ liệu cơ bản.
  String studentName = 'Nguyen Ha Vy';
  int age = 21;
  double height = 1.67;
  bool isStudent = true;

  // In giá trị bằng string interpolation.
  print('Student name: $studentName');
  print('Age: $age');
  print('Height: $height meters');
  print('Is student: $isStudent');

  // ${expression} cho phép đưa biểu thức vào chuỗi.
  print('Next year, $studentName will be ${age + 1} years old.');
}