import 'package:flutter/material.dart';
import 'authentication/authentication_controller.dart';
import 'authentication/firebase_auth.dart';

void main() {
  runApp(FlutterShop());
}

class FlutterShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthTest(),
    );
  }
}

class AuthTest extends StatefulWidget {
  @override
  _AuthTestState createState() => _AuthTestState();
}

class _AuthTestState extends State<AuthTest> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();

  @override
  void initState() {
    super.initState();

    firebaseAuthentication.getCurrentUser();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Test'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Login'),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  var user = await firebaseAuthentication.sigIn(email, password);
                  print(user);
                },
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                child: Text('SignOUt'),
                onPressed: () async {
                  firebaseAuthentication.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
