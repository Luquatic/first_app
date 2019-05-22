import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    print('[ProductManager Widget] build()');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: Products(products)),
      ],
    );
  }
}
