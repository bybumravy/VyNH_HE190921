import 'package:lab3/exercise1/product.dart';
import 'package:lab3/exercise1/product_repository.dart';

void main() async {
  ProductRepository repository = ProductRepository();

  repository.addProduct(
    Product(6, "Headphone1", 80),
  );

  repository.liveAdded().listen((product) {
    print("New product: $product");
  });

  repository.addProduct(
    Product(7, "Headphone12", 80),
  );
  List<Product> products = await repository.getAll();

  print("All products:");

  for (Product product in products) {
    print(product);
  }
  repository.addProduct(
    Product(4, "Monitor", 500),
  );
  repository.addProduct(
    Product(5, "Headphone", 80),
  );
  repository.dispose();
}