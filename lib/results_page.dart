import 'package:flutter/material.dart';
import 'constants.dart';
import 'container_card.dart';
import 'botoom_widget.dart';

class ResultPage extends StatelessWidget {
  final String titleText;
  final String bmiText;
  final String interpretaion;
  const ResultPage(
      {Key? key,
      required this.bmiText,
      required this.interpretaion,
      required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerCard(
              colour: inactiveCard,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    titleText.toUpperCase(),
                    style: overWeight,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiText,
                    style: resultData,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretaion,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomWidget(
            bottomText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
