import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_card.dart';
import 'container_child.dart';
import 'constants.dart';
import 'rounded_button.dart';
import 'botoom_widget.dart';
import 'results_page.dart';
import 'calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const BMI(),
    );
  }
}

enum Gender { maleCard, femaleCard }

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Color maleCardColour = inactiveCard;
  Color femaleCardColour = inactiveCard;
  int height = 160;
  int weight = 60;
  int age = 20;

  // void updateColor(Gender gender) {
  //   if (gender == Gender.maleCardColour) {
  //     if (maleCardColour == inactiveCard) {
  //       maleCardColour = activeCard;
  //       femaleCardColour = inactiveCard;
  //     } else {
  //       maleCardColour = inactiveCard;
  //       femaleCardColour = activeCard;
  //     }
  //   }
  //   if (gender == Gender.femaleCardColour) {
  //     if (femaleCardColour == inactiveCard) {
  //       femaleCardColour = activeCard;
  //       maleCardColour = inactiveCard;
  //     } else {
  //       femaleCardColour = inactiveCard;
  //       maleCardColour = activeCard;
  //     }
  //   }
  // }

  Gender selectedGender = Gender.maleCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    colour: selectedGender == Gender.maleCard
                        ? activeCard
                        : inactiveCard,
                    containerChild: const ContainerChild(
                      icoons: Icons.male,
                      textToDislay: 'Male',
                    ),
                    gestureFunction: () {
                      setState(
                        () {
                          // updateColor(Gender.maleCardColour);
                          selectedGender = Gender.maleCard;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    // colour: femaleCardColour,
                    colour: selectedGender == Gender.femaleCard
                        ? activeCard
                        : inactiveCard,
                    containerChild: const ContainerChild(
                      icoons: Icons.female,
                      textToDislay: 'Female',
                    ),
                    gestureFunction: () {
                      setState(
                        () {
                          // updateColor(Gender.maleCardColour);
                          selectedGender = Gender.femaleCard;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerCard(
              colour: const Color(0xFF1D2E33),
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'Height',
                      style: labelStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: numberStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: const Color(0xFFEB1555),
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    colour: const Color(0xFF1D2E33),
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: labelStyle,
                        ),
                        Text(
                          '$weight',
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RoundedButton(
                                child: const FaIcon(FontAwesomeIcons.plus),
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RoundedButton(
                                child: const FaIcon(FontAwesomeIcons.minus),
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    colour: const Color(0xFF1D2E33),
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: labelStyle,
                        ),
                        Text(
                          '$age',
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RoundedButton(
                                child: const FaIcon(FontAwesomeIcons.plus),
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RoundedButton(
                                child: const FaIcon(FontAwesomeIcons.minus),
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomWidget(
            bottomText: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    titleText: calc.calculatedBmi(),
                    bmiText: calc.calculate(),
                    interpretaion: calc.calculatedResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
