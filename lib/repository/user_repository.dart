import '../models/user_model.dart';

class UserRepository {
  var users = <String, UserModel>{};

  void save(UserModel model) {
    users[model.email] = model;
  }

  UserModel? get(String key) {
    return users[key];
  }
}