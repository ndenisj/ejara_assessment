import 'package:ejara_assessment/shared/models/user.model.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  UserModel _userModel = UserModel();
  User _user = User();

  UserModel get userModel => _userModel;
  set userModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  User get user => _user;
  set user(User user) {
    _user = user;
    notifyListeners();
  }
}
