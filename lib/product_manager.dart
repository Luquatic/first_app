import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager(this.startingProduct) {
    print('[ProductManager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    print('[ProductManager Widget] initState()');
    _products.add(widget.startingProduct);
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[ProductManager Widget] didUpdateWidget()');
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager Widget] build()');
    return Column(children: [Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _products.add('Advanced Food Tester');
          });
        },
        child: Text('Add Product'),
      ),
    ),
    Products(_products)
    ],);
  }
}
