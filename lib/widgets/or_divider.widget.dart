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
        const Expanded(child: Divider()),
        const SizedBox(width: 10),
        Text(
          "Or",
          style: theme.bodyText1,
        ),
        const SizedBox(width: 10),
        const Expanded(child: Divider()),
      ],
    );
  }
}
