import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/widgets/custom_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool logoVisible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 2),
      () {
        setState(() {
          logoVisible = true;
        });
      },
    );

    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacementNamed(Routes.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Container(
          color: Colors.white,
          child: AnimatedOpacity(
            opacity: logoVisible ? 1.0 : 0.0,
            duration: const Duration(seconds: 2),
            child: const CustomLogo(),
          ),
        ),
      ),
    );
  }
}
