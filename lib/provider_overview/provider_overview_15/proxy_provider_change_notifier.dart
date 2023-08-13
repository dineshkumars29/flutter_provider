import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountValue with ChangeNotifier {
  int count = 0;
  void incrementCount() {
    count++;
    notifyListeners();
  }
}

class Translations with ChangeNotifier {
  late int value;
  void update(CountValue newValue) {
    value = newValue.count;
    notifyListeners();
  }

  String get title => "Your tile is $value";
}

class ProxyProviderusingChangeNotifier extends StatefulWidget {
  const ProxyProviderusingChangeNotifier({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProxyProviderusingChangeNotifier();
}

class _ProxyProviderusingChangeNotifier
    extends State<ProxyProviderusingChangeNotifier> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<CountValue>(create: (_) => CountValue()),
              ChangeNotifierProxyProvider<CountValue, Translations>(
                  create: (_) => Translations(),
                  update: (BuildContext _, CountValue cv,
                      Translations? translations) {
                    translations!..update(cv);
                    return translations;
                  })
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                ShowTransalation(),
                SizedBox(height: 20),
                IncrementButton()
                // ElevatedButton(
                //     onPressed: () =>
                // context.read<CountValue>().incrementCount(),
                //    child: Text("increment"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowTransalation extends StatelessWidget {
  ShowTransalation({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = context.watch<Translations>().title;
    return Text(title);
  }
}

class IncrementButton extends StatelessWidget {
  IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    //  final String title = context.watch<Translations>().title;
    return ElevatedButton(
        onPressed: () => context.read<CountValue>().incrementCount(),
        child: Text("increment"));
  }
}
