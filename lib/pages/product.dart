import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/products/product_title.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ProductTitle(title),
                  SizedBox(width: 8.0),
                ],
              ),
            ),
            Text('Union Square, San Francisco | € ' + price.toString(),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
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
            )
          ],
        ),
      ),
    );
  }
}
