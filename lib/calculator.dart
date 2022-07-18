class Calculator {
  final int weight;
  final int height;
  Calculator({required this.height, required this.weight});

  late double _bmi = 1;
  calculate() {
    _bmi = weight / (height * height / (100 * 100));
    return _bmi.toStringAsFixed(1);
  }

  calculatedBmi() {
    String bmiResult;
    if (_bmi >= 25) {
      bmiResult = 'OverWeight';
    } else if (_bmi >= 18.50 && _bmi < 25) {
      bmiResult = 'Normal';
    } else {
      bmiResult = 'UnderWeight';
    }
    return bmiResult;
  }

  calculatedResult() {
    String resultString;
    if (_bmi <= 16.49) {
      resultString = 'You are Seriously UnderWeight. You should eat more!';
    } else if (_bmi >= 16.5 && _bmi <= 18.49) {
      resultString = 'You are UnderWeight. You should eat a little more!';
    } else if (_bmi >= 18.50 && _bmi <= 24.99) {
      resultString = 'You are at Normal Weight. Good, Keep it Up!';
    } else if (_bmi >= 25 && _bmi <= 29.99) {
      resultString = 'You are OverWeight. You should not eat Junk Food!';
    } else {
      resultString = 'You are suffering from Obesity';
    }
    return resultString;
  }
}
