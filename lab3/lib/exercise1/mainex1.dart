import 'package:lab3/exercise1/product.dart';
import 'package:lab3/exercise1/product_repository.dart';

void main() async {
  ProductRepository repository = ProductRepository();

  // Listen for newly added products
  repository.liveAdded().listen((product) {
    print("New product: $product");
  });

  // Get all existing products
  List<Product> products = await repository.getAll();

  print("All products:");

  for (Product product in products) {
    print(product);
  }

  // Add a new product
  repository.addProduct(
    Product(4, "Monitor", 500),
  );

  repository.addProduct(
    Product(5, "Headphone", 80),
  );

  // Close the stream controller
  repository.dispose();
}