import 'dart:async';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../scoped-models/main.dart';

import '../widgets/products/product_title.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  Widget _buildTitleContainer(String title) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ProductTitle(title),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }

  Widget _buildDescriptionColumn(String description) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              description,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Product product = model.allProducts[productIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(product.image),
              _buildTitleContainer(product.title),
              Text(
                'Union Square, San Francisco | € ' + product.price.toString(),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10.0,
              ),
              _buildDescriptionColumn(product.description),
            ],
          ),
        );
      },
    ));
  }
}
