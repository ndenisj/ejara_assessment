import 'package:flutter/material.dart';

import 'ejara_theme.dart';

Widget buildHeader(
    {required BuildContext context,
    required EjaraTheme theme,
    required double size,
    required String header}) {
  var height = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Text(
        header,
        style: theme.title1.copyWith(color: theme.primaryColor),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: height * size),
    ],
  );
}

Widget buildTextFormField(
    {required EjaraTheme theme,
    TextEditingController? controller,
    required String label,
    Function(String)? validator,
    String? hint,
    bool obscureText = false,
    Widget? suffix}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: theme.bodyText1.copyWith(fontSize: 14),
      ),
      const SizedBox(height: 3),
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (String? value) => validator!(value!),
        decoration: InputDecoration(
          hintText: hint,
          suffix: suffix,
        ),
      ),
    ],
  );
}
