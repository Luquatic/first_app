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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              TextField(
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
              ),
              SizedBox(height: 10.0),
              TextField(
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
              ),
              SwitchListTile(
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
                title: Text('Accept Terms'),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('LOGIN'),
                onPressed: () {
                  print(_usernameValue);
                  print(_passwordValue);
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
