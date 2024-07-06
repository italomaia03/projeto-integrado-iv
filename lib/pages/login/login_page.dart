import 'package:flutter/material.dart';
import 'package:somar/bd/database.dart';
import 'package:somar/models/usuario.dart';
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
  
  get usuario => null;
  
  void _login() {
    if(buttonClick){
      return;
    }

    setState(
      () {
      buttonClick = true;
    });

    // Gambiarra: não pode ter delay em login, isso é somente uma simulação
    Future.delayed(
      const Duration(seconds: 2),
      (){
        if(_formKey.currentState!.validate()){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Buscando usuários...'),
              ),
          );
          Usuario? usuario = Database().login(textUsuario.text.trim(), password.text.trim());
        }

        if(usuario == null){
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuário não encontrado!'),
              backgroundColor: Colors.red,
            ),);
        } else {
          // usuario existe
        }


        setState(() {
          buttonClick = false;
        });
      }
    );
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
                    if(value == null){
                      return 'Informe sua senha';
                    }
                    if (value.trim() == ''){
                       return 'Informe sua senha';
                    }
                    return null;
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
