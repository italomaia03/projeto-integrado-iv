import 'package:flutter/material.dart';
import 'package:somar/routes.dart';
import 'package:somar/widgets/custom_button.dart';
import 'package:somar/widgets/custom_edit.dart';
import 'package:somar/widgets/custom_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController textUsuario = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonClick = false;

  void _login() {
    // Implement your login logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomLogo(),
                const SizedBox(height: 30),
                CustomEdit(
                  controller: textUsuario,
                  hintText: 'Informe o seu E-mail',
                  icon: Icons.person,
                  validator: (value) {
                    if(value == null){
                      return 'Informe um e-mail';
                    }
                    if (value.trim() == ''){
                      return 'Informe um e-mail';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                CustomEdit(
                  controller: password,
                  hintText: 'Informe a sua senha',
                  icon: Icons.password,
                  isPassword: true,
                  validator: (value) {
                    return ''; // Add your validation logic here
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  caption: 'Entrar',
                  onTap: _login,
                  loading: buttonClick,
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.register);
                  },
                  child: const Text('Register now'),
                ),
                const SizedBox(height: 100.0),
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
      ),
    );
  }
}
