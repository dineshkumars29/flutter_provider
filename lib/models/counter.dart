import 'package:flutter/widgets.dart';

class Counter with ChangeNotifier {
  int counter = 0;
  void increaseCounter() {
    counter++;
    notifyListeners();
  }
}
