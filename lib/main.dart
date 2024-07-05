import 'package:flutter/material.dart';
import 'package:somar/pages/login_view.dart';
import 'package:somar/pages/register.dart';
import 'package:somar/pages/splash_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: true,
    ),
    home: SplashView(),
    initialRoute: '/',
    routes: {
      '/login': (context) => LoginView(),
      '/register': (context) => RegisterView()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Register'),
        ),
      ),
    );
  }
}
