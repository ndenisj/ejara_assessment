import 'package:ejara_assessment/shared/controllers/user.controller.dart';
import 'package:ejara_assessment/shared/models/user.model.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

import '../../../utils/ejara_theme.dart';
import '../../../utils/ejara_utils.dart';
import '../../../widgets/payment_method.widget.dart';

class ChoosePaymentMethodView extends StatelessWidget {
  const ChoosePaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);

    final user = Provider.of<UserController>(context).user;
    final userModel = Provider.of<UserController>(context).userModel;

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(
                context: context,
                theme: theme,
                size: 0.01,
                header: 'Choose a payment method',
              ),
              _buildPaymentCard(theme, size, user),
              SizedBox(height: size.height * 0.02),
              Text(
                "Select a payment method",
                style: theme.subtitle1.copyWith(color: theme.primaryColor),
              ),
              SizedBox(height: size.height * 0.01),
              const PaymentMethodWidget(),
              const PaymentMethodWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Card _buildPaymentCard(EjaraTheme theme, Size size, User user) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              children: [
                Card(
                  color: theme.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(
                      Remix.folder_2_line,
                      color: theme.ghostWhite,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  user.fullname(),
                  style: theme.bodyText2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                RichText(
                  text: TextSpan(children: <InlineSpan>[
                    TextSpan(
                      text: "20,000",
                      style: theme.subtitle1.copyWith(
                        fontSize: 26,
                        color: theme.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'CFA',
                      style: theme.bodyText2.copyWith(
                        fontSize: 26,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Earning per day",
                  style: theme.bodyText2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "10,000CFA",
                  style: theme.bodyText2.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
