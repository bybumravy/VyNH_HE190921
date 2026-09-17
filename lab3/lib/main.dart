import 'exercise1/product_repository.dart';
import 'exercise1/product.dart';

Future<void> main() async {
  print('===== EXERCISE 1 =====');

  final repository = ProductRepository();

  repository.liveAdded().listen((product) {
    print('New product: $product');
  });

  final products = await repository.getAll();

  print('All products:');

  for (final product in products) {
    print(product);
  }

  repository.addProduct(
    Product(
      id: 3,
      name: 'Keyboard',
      price: 80,
    ),
  );

  repository.dispose();
}