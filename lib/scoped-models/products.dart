import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import './connected_products.dart';

mixin ProductsModel on ConnectedProducts {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(products);
  }

  int get selectedProductIndex {
    return currSelectedProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return products[selectedProductIndex];
  }

  void updateProduct(String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userUsername: selectedProduct.userUsername,
        userId: selectedProduct.userId);
    products[selectedProductIndex] = updatedProduct;
    currSelectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    currSelectedProductIndex = null;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      userUsername: selectedProduct.userUsername,
      userId: selectedProduct.userId,
      isFavorite: newFavoriteStatus,
    );
    products[selectedProductIndex] = updatedProduct;
    notifyListeners();
    currSelectedProductIndex = null;
  }

  void selectProduct(int index) {
    currSelectedProductIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }
}
