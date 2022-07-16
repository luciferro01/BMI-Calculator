import 'package:flutter/material.dart';
import 'container_card.dart';
import 'container_child.dart';

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

// It also looks good 0xFF1D2E33
const activeCard = Color(0xFF1D1E33);
const inactiveCard = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender { maleCardColour, femaleCardColour }

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Color maleCardColour = inactiveCard;
  Color femaleCardColour = inactiveCard;

  void updateColor(Gender gender) {
    if (gender == Gender.maleCardColour) {
      if (maleCardColour == inactiveCard) {
        maleCardColour = activeCard;
        femaleCardColour = inactiveCard;
      } else {
        maleCardColour = inactiveCard;
        femaleCardColour = activeCard;
      }
    }
    if (gender == Gender.femaleCardColour) {
      if (femaleCardColour == inactiveCard) {
        femaleCardColour = activeCard;
        maleCardColour = inactiveCard;
      } else {
        femaleCardColour = inactiveCard;
        maleCardColour = activeCard;
      }
    }
  }

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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.maleCardColour);
                      });
                    },
                    child: ContainerCard(
                      colour: maleCardColour,
                      containerChild: const ContainerChild(
                        icoons: Icons.male,
                        textToDislay: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (() {
                      setState(() {
                        updateColor(Gender.femaleCardColour);
                      });
                    }),
                    child: ContainerCard(
                      colour: femaleCardColour,
                      containerChild: const ContainerChild(
                        icoons: Icons.female,
                        textToDislay: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerCard(
              colour: const Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    colour: const Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    colour: const Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
