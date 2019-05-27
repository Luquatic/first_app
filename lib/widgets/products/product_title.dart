import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String _productTitle;

  ProductTitle(this._productTitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      _productTitle,
      style: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
      ),
    );
  }
}
