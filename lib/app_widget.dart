import 'package:flutter/material.dart';
import 'package:somar/pages/login/login_page.dart';
import 'package:somar/pages/splash/splash_page.dart';
import 'package:somar/routes.dart';

import 'pages/register/register.dart';

class AppWidget extends StatelessWidget{
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Somar Mercantil',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        Routes.initial: (context) => const SplashPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterView(),
      },
      initialRoute: Routes.initial,
    );
  }
}