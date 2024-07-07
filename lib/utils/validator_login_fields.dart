class ValidatorLoginFields {
  static String? validateEmail(String? value) {
    var regexEmail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'Informe um e-mail';
    }
    if (!regexEmail.hasMatch(value)){
      return 'Informe um e-mail válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    var regexEmail = RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$');
    if (value == null || value.isEmpty) {
      return 'Informe uma senha';
    }
    if (!regexEmail.hasMatch(value)){
      return 'Informe uma senha válida'
          '\n- Pelo menos uma letra maiúscula (A-Z)'
          '\n- Pelo menos um número (0-9)'
          '\n- Pelo menos 8 caracteres'
          '\n- Pelo menos 1 caractere especial (!@#\$%^&*(),.?":{}|<>)';
    }
    return null;
  }
}