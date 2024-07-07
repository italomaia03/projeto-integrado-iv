import 'package:flutter/material.dart';
import 'package:somar/controllers/auth_controller.dart';
import 'package:somar/errors/validation_exception.dart';
import 'package:somar/routes.dart';
import 'package:somar/utils/validator_login_fields.dart';
import 'package:somar/widgets/custom_button.dart';
import 'package:somar/widgets/custom_edit.dart';
import 'package:somar/widgets/custom_logo.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.authController});

  final AuthController authController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController textUsuario = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showFeedbackMessage(message, status) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: status == 'ok' ? Colors.green : Colors.red,
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  void _login() {


    try {
      if (!_formKey.currentState!.validate()) {
        throw ValidationException('Preencha todos os campos de maneira adequada');
      }
      var email = textUsuario.text;
      widget.authController.get(email);
      _showFeedbackMessage('Usuário $email autenticado com sucesso', 'ok');
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } on Exception catch (e) {
      _showFeedbackMessage(e.toString(), 'error');
    }
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
                  validator: ValidatorLoginFields.validateEmail,
                ),
                const SizedBox(height: 40),
                CustomEdit(
                  controller: password,
                  hintText: 'Informe a sua senha',
                  icon: Icons.password,
                  isPassword: true,
                  validator: ValidatorLoginFields.validatePassword
                ),
                const SizedBox(height: 40),
                CustomButton(
                  caption: 'Entrar',
                  onTap: _login,
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.register);
                  },
                  child: const Text('Registre-se'),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 10),
                      IconButton(
                        icon: Icon(Icons.abc),
                        onPressed: () => true,
                        iconSize: 36.0,
                      ),
                      const SizedBox(height: 20),
                      IconButton(
                        icon: Icon(Icons.abc),
                        onPressed: () => true,
                        iconSize: 36.0,
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        icon: Icon(Icons.abc),
                        onPressed: () => true,
                        iconSize: 36.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Termos e Política de Privacidade'),
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
