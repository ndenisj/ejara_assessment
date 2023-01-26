import "package:flutter/material.dart";
import 'package:remixicon/remixicon.dart';

import '../utils/ejara_theme.dart';
import 'ejara_button.dart';
import 'or_divider.widget.dart';
import 'sub_payment_method.widget.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);

    return InkWell(
      onTap: () => _modalBottomSheetMenu(context, theme, size),
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: theme.primaryColor!.withOpacity(0.1),
            ),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: theme.secondaryColor!.withOpacity(0.1),
              radius: size.height * 0.025,
              child: Icon(
                Remix.money_dollar_circle_line,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cash payment',
                    style: theme.bodyText1.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fees: Offer',
                    style: theme.bodyText2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _modalBottomSheetMenu(
      BuildContext context, EjaraTheme theme, Size size) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (builder) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Select the mobile money method",
                        style:
                            theme.subtitle1.copyWith(color: theme.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Remix.close_line,
                        color: theme.secondaryText!.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SubPaymentMethodWidget(),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    const OrDividerWidget(),
                    SizedBox(height: size.height * 0.03),
                    EjaraButtonWidget(
                      text: "Another mobile money method",
                      icon: const Icon(Remix.add_line),
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ChoosePaymentMethodView(),
                        //   ),
                        // );
                      },
                      options: EjaraButtonOptions(
                        color: theme.secondaryColor,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    EjaraButtonWidget(
                      text: "Continue",
                      onPressed: () {},
                      options: const EjaraButtonOptions(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}