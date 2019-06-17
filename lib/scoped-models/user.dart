import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';
import './connected_products.dart';

mixin UserModel on ConnectedProducts {

  void login(String username, String password) {
    authenticatedUser = User(id: 'id1', username: username, password: password);
  }
}