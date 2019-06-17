import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProducts on Model {
  List<Product> products = [];
  User authenticatedUser;
  int currSelectedProductIndex;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userUsername: authenticatedUser.username,
        userId: authenticatedUser.id);
    products.add(newProduct);
    currSelectedProductIndex = null;
    notifyListeners();
  }
}
