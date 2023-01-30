import 'package:ejara_assessment/presentations/payment/models/payment_type.model.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../utils/ejara_theme.dart';

class SubPaymentMethodWidget extends StatelessWidget {
  const SubPaymentMethodWidget({
    Key? key,
    required this.paymentType,
  }) : super(key: key);

  final PaymentType paymentType;

  @override
  Widget build(BuildContext context) {
    var theme = EjaraTheme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Remix.checkbox_blank_circle_line,
              color: theme.secondaryText!.withOpacity(0.5),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Orange Money",
                    style: theme.subtitle1.copyWith(color: theme.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '67378822',
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
}
