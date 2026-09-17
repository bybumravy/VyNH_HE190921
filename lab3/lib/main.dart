import 'exercise1/product.dart';
import 'exercise1/product_repository.dart';

import 'exercise2/user_repository.dart';

import 'exercise3/async_microtask.dart';

import 'exercise4/stream_transformation.dart';

// import 'exercise5/settings.dart';

Future<void> runExercise1() async {
  print('\n===== EXERCISE 1 =====');

  final repository = ProductRepository();

  // Listen for newly added products.
  repository.liveAdded().listen((product) {
    print('New product: $product');
  });

  // Get all existing products.
  final products = await repository.getAll();

  print('All products:');

  for (final product in products) {
    print(product);
  }

  // Add a new product.
  repository.addProduct(
    Product(
      id: 3,
      name: 'Keyboard',
      price: 80,
    ),
  );

  repository.dispose();
}

Future<void> runExercise2() async {
  print('\n===== EXERCISE 2 =====');

  final repository = UserRepository();

  final users = await repository.fetchUsers();

  for (final user in users) {
    print(user);
  }
}

Future<void> main() async {
  await runExercise1();

  await runExercise2();

  await runExercise3();

  await runExercise4();

  // runExercise5();

  print('\n===== ALL EXERCISES COMPLETED =====');
}