// ignore_for_file: use_build_context_synchronously

import 'package:ejara_assessment/presentations/login/controller/login.controller.dart';
import 'package:ejara_assessment/utils/ejara_theme.dart';
import 'package:ejara_assessment/utils/ejara_utils.dart';
import 'package:ejara_assessment/widgets/ejara_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

import '../../payment/views/choose_payment_method.view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);

    final loginCtrl = Provider.of<LoginController>(context);

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      bottomNavigationBar: SizedBox(
        height: size.height * 0.1,
        child: Center(
          child: InkWell(
            onTap: () {},
            child: RichText(
              text: TextSpan(children: <InlineSpan>[
                TextSpan(
                  text: "Don't have an account? ",
                  style: theme.bodyText1,
                ),
                TextSpan(
                  text: 'Sign up',
                  style: theme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: loginCtrl.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildHeader(
                  context: context,
                  theme: theme,
                  size: 0.04,
                  header: 'Login to account',
                ),
                buildTextFormField(
                  key: const ValueKey('username'),
                  controller: loginCtrl.usernameCtrl,
                  theme: theme,
                  label: "Username",
                  hint: 'Username',
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.02),
                buildTextFormField(
                  key: const ValueKey('password'),
                  theme: theme,
                  controller: loginCtrl.passwordCtrl,
                  label: "Password",
                  hint: 'Password',
                  obscureText: loginCtrl.obscureText,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  suffix: InkWell(
                    onTap: () => loginCtrl.toogleObscureText(),
                    child: Icon(loginCtrl.obscureText
                        ? Remix.eye_line
                        : Remix.eye_off_line),
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: theme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                EjaraButtonWidget(
                  text: "Sign in",
                  key: const Key('loginBtn'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (loginCtrl.loginFormKey.currentState!.validate()) {
                      var response = await loginCtrl.login(context);

                      if (response['reqSuccess']) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ChoosePaymentMethodView(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red[500],
                          content: Row(
                            children: [
                              const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  response['reqMessage'],
                                  style: theme.bodyText1
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ));
                      }
                    }
                  },
                  options: const EjaraButtonOptions(
                    textStyle: TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
