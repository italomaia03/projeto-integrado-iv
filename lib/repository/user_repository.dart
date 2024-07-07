import '../models/user_model.dart';

class UserRepository {
  var users = <String, UserModel>{
    'fabricio@gmail.com' : UserModel(
      'Fabricio',
      'Freitas',
      'fabricio@gmail.com',
      'Abcd@1234',
      'Professor',
      '123456'
    )
  };

  void save(UserModel model) {
    users[model.email] = model;
  }

  UserModel? get(String key) {
    return users[key];
  }
}