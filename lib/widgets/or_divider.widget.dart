import 'package:flutter/material.dart';

import '../utils/ejara_theme.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = EjaraTheme.of(context);
    return Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(width: 10),
        Text(
          "Or",
          style: theme.bodyText1,
        ),
        SizedBox(width: 10),
        Expanded(child: Divider()),
      ],
    );
  }
}
