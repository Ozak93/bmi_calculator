import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  final Function ontapped;
  final String title;

  const BottomButton({this.ontapped, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
            child: Text(
              title,
              style: KLargeButtonTextStyle,
            )),
      ),
      onTap: ontapped,
    );
  }
}