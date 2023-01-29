import 'package:ejara_assessment/presentations/login/model/login.model.dart';
import 'package:ejara_assessment/services/network_service.dart';
import 'package:ejara_assessment/shared/controllers/user.controller.dart';
import 'package:ejara_assessment/shared/models/user.model.dart';
import 'package:ejara_assessment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier {
  final NetworkService _networkService;
  LoginController(this._networkService);

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool obscureText = true;
  toogleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(BuildContext context) async {
    LoginRequest loginPostRequest = LoginRequest(
        log: usernameCtrl.text.trim(), password: passwordCtrl.text);

    // USED during unit test
    // var response = await _networkService.test_post(
    //   body: {"key": "value"},
    //   apiKey: {"key": "value"},
    //   clientID: {"key": "value"},
    //   endpoint: {"key": "value"},
    // );

    var response = await _networkService.post(
      apiKey: kAPIKEY,
      clientID: kCLIENTID,
      body: loginRequestToMap(loginPostRequest),
      endpoint: 'auth/login',
    );

    if (response['reqSuccess']) {
      var serverResponse = response['reqResponse'];

      if (serverResponse['responsecode'] != null &&
          serverResponse['responsecode'] == 'login_ok') {
        final userCtrl = Provider.of<UserController>(context, listen: false);
        userCtrl.userModel = UserModel.fromMap(serverResponse);
        userCtrl.user = User.fromMap(serverResponse['data']);

        return response;
      } else {
        return response;
      }
    } else {
      return response;
    }
  }
}
