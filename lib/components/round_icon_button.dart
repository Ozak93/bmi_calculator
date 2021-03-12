import 'package:flutter/material.dart';
import 'package:bmi_calc/components/constants.dart';
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onpressed;

  RoundIconButton(this.icon, this.onpressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      splashColor: Colors.red,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 0.0,
      disabledElevation: 6.0,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onpressed,
      onLongPress: onpressed,
    );
  }
}
