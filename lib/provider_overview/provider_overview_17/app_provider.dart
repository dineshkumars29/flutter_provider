import 'package:flutter/material.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_17/success_page.dart';

enum AppState { initial, loading, success, error }

class AppProvider with ChangeNotifier {
  AppState _State = AppState.initial;
  AppState get State => _State;

  Future<void> getResult(BuildContext context, searchItem) async {
    _State = AppState.loading;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    try {
      print(searchItem);
      if (searchItem == "fail") {
        throw "something want wrong";
      }
      _State = AppState.success;
      notifyListeners();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SuccessPage()));
    } catch (value) {
      _State = AppState.error;
      notifyListeners();

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Column(
                    children: [Text("Good Day. but have some errors occures")]),
              ));
    }
  }
}
