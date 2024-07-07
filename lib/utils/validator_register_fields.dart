class ValidatorRegisterFields {
  static String? validateName(String? value) {
    if(value == null || value.isEmpty) {
      return 'Informe o nome';
    }
    return null;
  }

  static String? validateUserFunctionalId (String? value) {
    var regex = RegExp(r'\d{6}');
    if(value == null || value.isEmpty) {
      return 'Informe o ID funcional do usuário';
    }
    if(!regex.hasMatch(value)) {
      return 'Informe um ID funcional válido';
    }
    return null;
  }

  static String? validateRepeatPassword(String? value, String? password) {
    if(value != password) {
      return 'As senhas informadas não são iguais';
    }
    return null;
  }
}