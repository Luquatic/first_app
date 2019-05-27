import 'dart:async';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;

  ProductPage(this.title, this.imageUrl, this.price);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This cannot be undone'),
            actions: <Widget>[
              FlatButton(
                  child: Text('DISCARD'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                child: Text('CONFIRM'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

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
          Image.asset(title),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      '€ ' + price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
          Text('Union Square, San Francisco'),
          Text('Description'),
        ],
      ),
      ),
    );
  }
}
