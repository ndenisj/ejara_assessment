import "package:flutter/material.dart";
import 'package:remixicon/remixicon.dart';

import '../../../utils/ejara_theme.dart';
import '../../../widgets/payment_method.widget.dart';

class ChoosePaymentMethodView extends StatelessWidget {
  const ChoosePaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose a payment method",
                style: theme.title1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.02),
              Card(
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
                            "Ejara Flex",
                            style: theme.subtitle2.copyWith(
                              fontSize: 16,
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
                                style: theme.bodyText1.copyWith(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
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
              ),
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
}
