import 'package:somar/controllers/errors/duplicated_user_exception.dart';
import 'package:somar/controllers/errors/user_not_found_exception.dart';
import 'package:somar/models/user_model.dart';
import 'package:somar/repository/user_repository.dart';

class AuthController {
  final UserRepository _repository;

  AuthController(this._repository);

  void save(UserModel model) {
    UserModel? saved = _repository.get(model.email);
    if (saved != null) {
      throw DuplicatedUserException('Usuário já cadastrado');
    }
    _repository.save(model);
  }

  UserModel get(String key) {
    var user = _repository.get(key);
    if(user == null) {
      throw UserNotFoundException('Usuário não encontrado');
    }
    return user;
  }
}