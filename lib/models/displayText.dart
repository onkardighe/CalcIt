import 'package:calcit/utils/calculator.dart';
import 'package:flutter/material.dart';

class DisplayText extends ChangeNotifier {
  String _answerText = "Onkar";
  String _queryText = "0";

  String get answerText => _answerText;
  String get queryText => _queryText;
  Calculator _calculator = CalculateFromString();

  appendQuery(String newQuery) {
    if (_queryText == "0") {
      _queryText = newQuery;
    } else {
      _queryText += newQuery;
    }
    notifyListeners();
  }

  backspaceQuery() {
    if (_queryText.length > 1) {
      _queryText = _queryText.substring(
          0,
          queryText.endsWith("Ans")
              ? _queryText.length - 3
              : _queryText.length - 1);
    } else {
      _queryText = "0";
    }

    if (_queryText == "0" || _queryText.isEmpty) {
      _queryText = "0";
      _answerText = "0";
    }
    notifyListeners();
  }

  clearQuery() {
    _queryText = "0";
    _answerText = "0";
    notifyListeners();
  }

  calculateQuery() {
    String q = _queryText
        .replaceAll("Ans", _answerText)
        .replaceAll("x", "*")
        .replaceAll("÷", "/");
    if (q.trim().length == 0) return;

    _answerText = _calculator.calculate(query: q);
    notifyListeners();
  }

  copyAnswerToQuery() {
    if (_answerText != 0) {
      _queryText = "Ans";
    }
    notifyListeners();
  }
}

DisplayText displayText = DisplayText();
