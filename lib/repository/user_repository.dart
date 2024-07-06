import '../models/user_model.dart';

class UserRepository {
  var users = <String, UserModel>{};

  UserModel save(UserModel model) {
    users[model.email] = model;
    return model;
  }

  List<UserModel> getAll() {
    return users.values.toList();
  }

  UserModel? get(String key) {
    return users[key];
  }

  void update(String key, UserModel model) {
    if(!users.containsKey(key)) {
      throw ArgumentError('The user does not exists');
    }
    users[key] = model;
  }

  void delete(String key) {
    if(!users.containsKey(key)) {
      throw ArgumentError('The user does not exists');
    }
    users.remove(key);
  }
}