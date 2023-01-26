import 'package:ejara_assessment/presentations/payment/views/choose_payment_method.view.dart';
import 'package:ejara_assessment/utils/ejara_theme.dart';
import 'package:ejara_assessment/widgets/ejara_button.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);

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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login to account",
                style: theme.title2.copyWith(color: theme.primaryColor),
              ),
              SizedBox(height: size.height * 0.04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: theme.bodyText1,
                  ),
                  const SizedBox(height: 3),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: theme.bodyText1,
                  ),
                  const SizedBox(height: 3),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffix: InkWell(
                        onTap: () {},
                        child: Icon(Remix.eye_line),
                      ),
                    ),
                  ),
                ],
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChoosePaymentMethodView(),
                    ),
                  );
                },
                options: EjaraButtonOptions(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
