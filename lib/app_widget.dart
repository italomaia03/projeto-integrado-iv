import 'package:flutter/material.dart';
import 'package:somar/controllers/auth_controller.dart';
import 'package:somar/pages/home/home_page.dart';
import 'package:somar/pages/login/login_page.dart';
import 'package:somar/pages/produtos/protudo_page.dart';
import 'package:somar/pages/splash/splash_page.dart';
import 'package:somar/repository/user_repository.dart';
import 'package:somar/routes.dart';
import 'pages/register/register.dart';

class AppWidget extends StatelessWidget{
  AppWidget({super.key});
  final UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Somar Mercantil',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        Routes.initial: (context) => const SplashPage(),
        Routes.login: (context) => LoginPage(authController: AuthController(userRepository)),
        Routes.register: (context) => RegisterView(authController: AuthController(userRepository)),
        Routes.home: (context) => const HomePage(),
        Routes.produtos: (context) => const ProdutoPage(),
      },
      initialRoute: Routes.initial,
    );
  }
}