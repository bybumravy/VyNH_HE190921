// Exercise 5: Async, Future, Null Safety & Streams

// Hàm main phải có async để sử dụng await.
Future<void> main() async {
  print('Starting data loading...');

  // Chờ hàm loadData() hoàn thành.
  String result = await loadData();

  print(result);
  print('Data loading completed.');

  // String? cho phép biến nhận giá trị null.
  String? nickname;

  // ?? dùng giá trị bên phải nếu nickname là null.
  String displayedName = nickname ?? 'No nickname';
  print('Displayed name: $displayedName');

  // Gán giá trị khác null.
  nickname = 'Vy';

  // ! khẳng định rằng nickname chắc chắn không phải null.
  print('Nickname length: ${nickname!.length}');

  print('Stream started:');

  // await for nhận lần lượt từng dữ liệu từ Stream.
  await for (int value in createNumberStream()) {
    print('Stream value: $value');
  }

  print('Stream completed.');
}

// Future mô phỏng quá trình tải dữ liệu.
Future<String> loadData() async {
  // Chờ 2 giây.
  await Future.delayed(const Duration(seconds: 2));

  return 'Student data loaded successfully!';
}

// Stream phát lần lượt các số từ 1 đến 5.
Stream<int> createNumberStream() async* {
  for (int number = 1; number <= 5; number++) {
    // Chờ 500 mili giây giữa mỗi giá trị.
    await Future.delayed(const Duration(milliseconds: 500));

    // yield đưa một giá trị vào Stream.
    yield number;
  }
}