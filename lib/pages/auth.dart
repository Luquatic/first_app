import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'username': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/images/background.jpg'),
    );
  }

  Widget _buildUsernameTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Username',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a username';
        }
      },
      onSaved: (String value) {
        _formData['username'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
        textAlign: TextAlign.center,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Password',
        ),
        validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a password';
        }
      },
        onSaved: (String value) {
          _formData['password'] = value;
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm(Function login) {
    // if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
    //   return;
    // }
    // _formKey.currentState.save();
    login(_formData['username'], _formData['password']);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.85;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(image: _buildBackgroundImage()),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Column(children: <Widget>[
                  _buildUsernameTextField(),
                  SizedBox(height: 10.0),
                  _buildPasswordTextField(),
                  _buildAcceptSwitch(),
                  ScopedModelDescendant<MainModel>(
                    builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('LOGIN'),
                        onPressed: () => _submitForm(model.login),
                      );
                    },
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
