import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        addProduct({'title': 'Chocolate', 'image': 'assets/food.jpg'});
      },
      child: Icon(Icons.add),
    );
  }
}
