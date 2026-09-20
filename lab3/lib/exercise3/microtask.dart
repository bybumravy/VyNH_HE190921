import 'dart:async';

void main() {
  print("1. Start");

  scheduleMicrotask(() {
    print("3. Microtask");
  });

  Future(() {
    print("4. Future event");
  });

  print("2. End");
}