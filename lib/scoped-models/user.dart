import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';

mixin UserModel on Model {
  User _authenticatedUser;

  void login(String username, String password) {
    _authenticatedUser = User(id: 'id1', username: username, password: password);
  }
}