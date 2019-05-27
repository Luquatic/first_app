import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Description'),
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Price'),
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  Widget _buildRaisedButton() {
    return RaisedButton(
      child: Text('Save'),
      onPressed: () {
        final Map<String, dynamic> product = {
          'title': _titleValue,
          'description': _descriptionValue,
          'price': _priceValue,
          'image': 'assets/images/food.jpg'
        };
        widget.addProduct(product);
        Navigator.pushReplacementNamed(context, '/products');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          _buildRaisedButton(),
        ],
      ),
    );
  }
}
