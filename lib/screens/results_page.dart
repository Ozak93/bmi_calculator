
import 'package:bmi_calc/components/bottom_button.dart';
import 'package:bmi_calc/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/components/constants.dart';
import 'package:bmi_calc/calculator_brain.dart';
class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                cardColor: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: KresultsTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: KBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: KBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
          ),
          BottomButton(title: 'RE-CALCULCATE',ontapped: (){Navigator.pop(context);},)
        ],
      ),
    );
  }
}
