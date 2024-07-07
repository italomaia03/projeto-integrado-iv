class UserModel {
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _function;
  String _functionalId;

  UserModel(this._firstName, this._lastName, this._email, this._password,
      this._function, this._functionalId);

  String get functionalId => _functionalId;

  set functionalId(String value) {
    _functionalId = value;
  }

  String get function => _function;

  set function(String value) {
    _function = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }
}
