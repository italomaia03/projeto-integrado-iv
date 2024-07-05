import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:somar/pages/login_view.dart';
import 'package:somar/util/custom_page_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blueAccent, Colors.black12, Colors.blueAccent],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Center(
        child: Image.asset(
          'assets/icons/somar-logo.png',
        ),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(CustomPageRoute(child: LoginView()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
