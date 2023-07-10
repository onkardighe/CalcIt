import 'package:math_expressions/math_expressions.dart';

abstract class Calculator {
  String calculate({required String query});
}

class CalculateFromString extends Calculator {
  @override
  String calculate({required String query}) {
    query = query.replaceAll("x", "*").replaceAll("÷", "/");

  
    Parser parser = Parser();
    Expression expression = parser.parse(query);
    ContextModel cm = ContextModel();
    return expression.evaluate(EvaluationType.REAL, cm).toString();
  }
}
