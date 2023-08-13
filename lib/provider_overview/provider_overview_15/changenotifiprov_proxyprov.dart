import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountValue with ChangeNotifier {
  int count = 0;
  void incrementCount() {
    count++;
    notifyListeners();
  }
}

class Translations {
  Translations(this.value);
  int value;

  void update(int newValue) {
    value = newValue;
  }

  String get title => "Your tile is $value";
}

class changeNotiProvAndProxyProvider extends StatefulWidget {
  const changeNotiProvAndProxyProvider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _changeNotiProvAndProxyProvider();
}

class _changeNotiProvAndProxyProvider
    extends State<changeNotiProvAndProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountValue>(create: (_) => CountValue()),
        ProxyProvider<CountValue, Translations>(
            update: (_, CountValue, __) => Translations(CountValue.count))
      ],
      child: Column(
        children: [
          ShowTransalation(),
          SizedBox(height: 20),
          IncrementButton(),
          //! below button not working
          // ElevatedButton(
          //     onPressed: () => context.read<CountValue>().incrementCount(),
          //     child: Text("increment"))
        ],
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
