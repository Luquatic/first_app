import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _usernameValue;
  String _passwordValue;
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/images/background.jpg'),
    );
  }

  Widget _buildUsernameTextField() {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Username',
      ),
      onChanged: (String value) {
        setState(() {
          _usernameValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      textAlign: TextAlign.center,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
      ),
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  Widget _buildLoginRaisedButton() {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text('LOGIN'),
      onPressed: () {
        print(_usernameValue);
        print(_passwordValue);
        Navigator.pushReplacementNamed(context, '/products');
      },
    );
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
                  _buildLoginRaisedButton(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
