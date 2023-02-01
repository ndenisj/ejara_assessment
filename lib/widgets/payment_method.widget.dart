import 'package:ejara_assessment/presentations/payment/models/payment_method.model.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

import '../presentations/payment/controller/payment_method.controller.dart';
import '../presentations/payment/views/new_wallet.view.dart';
import '../utils/ejara_theme.dart';
import 'ejara_button.dart';
import 'or_divider.widget.dart';
import 'sub_payment_method.widget.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key, required this.paymentMethod});

  final PaymentMethod paymentMethod;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);

    final payMetCtrl = Provider.of<PaymentMethodController>(context);

    return InkWell(
      onTap: () {
        payMetCtrl.selectedPayment = paymentMethod;
        _modalBottomSheetMenu(context);
      },
      child: _buildPaymentMethodDisplay(theme, size),
    );
  }

  Container _buildPaymentMethodDisplay(EjaraTheme theme, Size size) {
    return Container(
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
              color: theme.iconColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paymentMethod.titleEn!,
                  style: theme.bodyText1.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                Text(
                  paymentMethod.descriptionEn!,
                  style: theme.bodyText2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBottomSheet();
        });
  }
}

class StatefulBottomSheet extends StatefulWidget {
  StatefulBottomSheet({Key? key});

  @override
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends State<StatefulBottomSheet> {
  @override
  void initState() {
    super.initState();

    getPaymentMethods();
  }

  getPaymentMethods() async {
    await Provider.of<PaymentMethodController>(context, listen: false)
        .getPaymentTypeList(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);
    final payMetCtrl = Provider.of<PaymentMethodController>(context);

    return payMetCtrl.isTypeLoading
        ? Container(
            height: size.height * 0.4,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            key: const Key('paymentTypesBSheet'),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Select the ${payMetCtrl.selectedPayment.titleEn} method",
                          style: theme.subtitle1
                              .copyWith(color: theme.primaryColor),
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
                          if (payMetCtrl.paymentTypes.isEmpty)
                            Text(
                              'No payment type',
                              style: theme.bodyText1,
                            )
                          else
                            for (var i = 0;
                                i < payMetCtrl.paymentTypes.length;
                                i++) ...[
                              SubPaymentMethodWidget(
                                  paymentType: payMetCtrl.paymentTypes[i]),
                            ],
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      if (payMetCtrl.paymentTypes.isNotEmpty)
                        const OrDividerWidget(),
                      SizedBox(height: size.height * 0.03),
                      EjaraButtonWidget(
                        key: const Key('addWalletKey'),
                        text: "Another mobile money method",
                        icon: Icon(
                          Remix.add_line,
                          color: theme.secondaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewWalletView(),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        options: EjaraButtonOptions(
                          elevation: 0,
                          color: const Color(0xFFEDF0FC),
                          textStyle: theme.subtitle2.copyWith(
                            color: theme.secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      EjaraButtonWidget(
                        text: "Continue",
                        onPressed: null,
                        disabled: payMetCtrl.selectedPaymentType.id != null
                            ? false
                            : true,
                        options: const EjaraButtonOptions(
                          disabledColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
