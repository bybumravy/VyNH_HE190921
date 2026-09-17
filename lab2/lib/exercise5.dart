Future<void> main() async {
  print('Starting data loading...');
  String result = await loadData();
  print(result);
  print('Data loading completed.');
  String? nickname;
  String displayedName = nickname ?? 'No nickname';
  print('Displayed name: $displayedName');
  nickname = 'Vy';
  print('Nickname length: ${nickname!.length}');
  print('Stream started:');
  await for (int value in createNumberStream()) {
    print('Stream value: $value');
  }
  print('Stream completed.');
}

Future<String> loadData() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Student data loaded successfully!';
}

Stream<int> createNumberStream() async* {
  for (int number = 1; number <= 5; number++) {
    await Future.delayed(const Duration(milliseconds: 500));
    yield number;
  }
}