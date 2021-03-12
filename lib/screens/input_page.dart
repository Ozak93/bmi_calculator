import 'package:bmi_calc/calculator_brain.dart';
import 'package:bmi_calc/components/bottom_button.dart';
import 'package:bmi_calc/components/constants.dart';
import 'package:bmi_calc/components/icon_content.dart';
import 'package:bmi_calc/components/reusable_card.dart';
import 'package:bmi_calc/components/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';

enum Genders { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INactiveCardColor;
  Color femaleCardColor = KActiveCardColor;
  int height = 170;
  int weight = 70;
  int age = 25;
  Genders selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        cardColor: selectedGender == Genders.Male
                            ? maleCardColor = KSelectedCardColor
                            : maleCardColor = INactiveCardColor,
                        cardChild: IconContent('Male', FontAwesomeIcons.mars),
                        onPressed: () {
                          setState(() {
                            selectedGender = Genders.Male;
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == Genders.Female
                          ? femaleCardColor = KSelectedCardColor
                          : femaleCardColor = INactiveCardColor,
                      cardChild: IconContent('Female', FontAwesomeIcons.venus),
                      onPressed: () {
                        setState(() {
                          selectedGender = Genders.Female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: KTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: KNumbersStyle,
                              ),
                              Text('cm')
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                activeTrackColor: Colors.white,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 30)),
                            child: Slider(

                              value: height.toDouble(),
                              min: 70.0,
                              max: 250.0,
                              onChanged: (value) {
                                setState(() {
                                  height = value.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    //weight card
                    child: ReusableCard(
                      cardColor: KActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: KTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: KNumbersStyle,
                              ),
                              Text(
                                'Kg',
                                style: KTextStyle,
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    //age card
                    child: ReusableCard(
                      cardColor: KActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: KTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KNumbersStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              title: 'CALCULATE',
              ontapped: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            interpretation: calc.getInterpretation(),
                            resultText: calc.getResult())));
              },
            )
          ],
        ));
  }
}
