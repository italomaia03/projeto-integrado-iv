import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var row = Column(
                children: <Widget>[
                    Row(
                    children: <Widget>[
                      Row(children: [
                        Checkbox(value: false, onChanged: (bool? value) {},),
                      const Text('Remember Password'),
                      ],)
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot my password'),
                  ),
                ],

          );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppBar(
                title: const Text('Login'),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Image.asset(
                  'assets/icons/somar-logo.png',
                  height: 100.0,
                ),
              ),
              const SizedBox(height: 50.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 4.0),
              row,
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register now'),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google),
                      onPressed: () => true,
                      iconSize: 48.0,
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      onPressed: () => true,
                      iconSize: 48.0,
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      onPressed: () => true,
                      iconSize: 48.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 112.0),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Terms and Policies of Privacy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
