import 'package:flutter/material.dart';

import 'constants.dart';


class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: KTextStyle,
        )
      ],
    );
  }
}