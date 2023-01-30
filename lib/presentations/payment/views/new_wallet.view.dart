import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../utils/ejara_theme.dart';
import '../../../utils/ejara_utils.dart';
import '../../../widgets/ejara_button.dart';

class NewWalletView extends StatefulWidget {
  const NewWalletView({super.key});

  @override
  State<NewWalletView> createState() => _NewWalletViewState();
}

class _NewWalletViewState extends State<NewWalletView> {
  String _mobile_operator = 'Orange Money';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = EjaraTheme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                key: const Key('closeWalletScreen'),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEDF0FC),
                  ),
                  child: Icon(
                    Remix.close_line,
                    color: theme.primaryColor,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildHeader(
                        context: context,
                        theme: theme,
                        size: 0.02,
                        header: 'New mobile money',
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose the mobile operator",
                            style: theme.bodyText1.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 3),
                          FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: const InputDecoration(),
                                isEmpty: _mobile_operator == '',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String?>(
                                    value: _mobile_operator,
                                    isDense: true,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _mobile_operator = newValue!;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: ["Orange Money"].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: theme.bodyText1,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      buildTextFormField(
                        theme: theme,
                        label: "Phone number",
                        hint: '',
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      buildTextFormField(
                        theme: theme,
                        label: "Full name",
                        hint: '',
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          Icon(
                            Remix.toggle_fill,
                            color: Colors.blue.shade700,
                            size: 26,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Save as payment method",
                              style: theme.bodyText2.copyWith(
                                color: theme.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              EjaraButtonWidget(
                text: "Continue",
                onPressed: () {
                  Navigator.pop(context);
                },
                options: const EjaraButtonOptions(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
