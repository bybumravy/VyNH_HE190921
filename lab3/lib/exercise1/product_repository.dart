import 'dart:async';

import 'product.dart';

class ProductRepository {

  final StreamController<Product> _controller =
  StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    return [
      Product(1, "Laptop", 2000),
      Product(2, "Mouse", 50),
      Product(3, "Keyboard", 100),
    ];
  }
  Stream<Product> liveAdded() {
    return _controller.stream;
  }
  void addProduct(Product product) {
    _controller.add(product);
  }
  void dispose() {
    _controller.close();
  }
}