import 'package:flutter/material.dart';
import 'package:somar/controllers/auth_controller.dart';
import 'package:somar/errors/validation_exception.dart';
import 'package:somar/models/user_model.dart';
import 'package:somar/utils/validator_login_fields.dart';
import 'package:somar/utils/validator_register_fields.dart';
import 'package:somar/widgets/custom_edit.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key, required this.authController});

  final AuthController authController;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _functionalIdController = TextEditingController();
  final TextEditingController _functionController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Implement photo upload functionality here
                  },
                  child: const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.camera_alt),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomEdit(
                  controller: _functionalIdController,
                  hintText: 'ID Funcional',
                  validator: ValidatorRegisterFields.validateUserFunctionalId,
                ),
                const SizedBox(height: 10.0),
                CustomEdit(
                  controller: _functionController,
                  hintText: 'Cargo',
                  validator: ValidatorRegisterFields.validateName,
                ),
                const SizedBox(height: 10.0),
                CustomEdit(
                  controller: _firstNameController,
                  hintText: 'Nome',
                  validator: ValidatorRegisterFields.validateName,
                ),
                const SizedBox(height: 10.0),
                CustomEdit(
                  controller: _lastNameController,
                  hintText: 'Sobrenome',
                  validator: ValidatorRegisterFields.validateName,
                ),
                const SizedBox(height: 10.0),
                CustomEdit(
                    controller: _emailController,
                    hintText: 'E-mail',
                    validator: ValidatorLoginFields.validateEmail),
                const SizedBox(height: 10.0),
                CustomEdit(
                  controller: _passwordController,
                  hintText: 'Senha',
                  validator: ValidatorLoginFields.validatePassword,
                  isPassword: true,
                ),
                const SizedBox(height: 10.0),
                CustomEdit(
                  controller: _repeatPasswordController,
                  isPassword: true,
                  hintText: 'Repita a senha',
                  validator: (value) =>
                      ValidatorRegisterFields.validateRepeatPassword(
                          value, _passwordController.text),
                ),
                const SizedBox(height: 10.0),
                CheckboxListTile(
                    title: Text('Eu concordo com os termos de privacidades'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    }),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Register',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  void _register() {
    try {
      if (!_formKey.currentState!.validate()) {
        throw ValidationException('Preencha todos os campos de maneira adequada');
      }
      if (!_isChecked) {
        throw ValidationException('É necessário aceitar os termos de privacidade');
      }
      var model = UserModel(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _passwordController.text,
          _functionController.text,
          _functionalIdController.text
      );
      widget.authController.save(model);
      _showFeedbackMessage('Usuário ${_emailController.text} cadastrado com sucesso', 'ok');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    } on Exception catch (e) {
      _showFeedbackMessage(e.toString(), 'error');
    }
  }
}
