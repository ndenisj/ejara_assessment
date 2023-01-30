import 'package:ejara_assessment/presentations/payment/models/payment_type.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

import '../presentations/payment/controller/payment_method.controller.dart';
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

    final payMetCtrl = Provider.of<PaymentMethodController>(context);

    return InkWell(
      onTap: () {
        payMetCtrl.selectedPaymentType = paymentType;
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                payMetCtrl.selectedPaymentType.id == paymentType.id
                    ? Remix.checkbox_circle_fill
                    : Remix.checkbox_blank_circle_line,
                color: theme.secondaryText,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentType.fullName!,
                      style:
                          theme.subtitle1.copyWith(color: theme.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      paymentType.identification!,
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
      ),
    );
  }
}
