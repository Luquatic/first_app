import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct}) {
    print('[ProductManager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    super.initState();
    print('[ProductManager Widget] initState()');
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[ProductManager Widget] didUpdateWidget()');
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
     _products.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager Widget] build()');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: Products(_products, deleteProduct: _deleteProduct)),
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
      ],
    );
  }
}
