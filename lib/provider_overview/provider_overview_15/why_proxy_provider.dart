import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  const Translations(this.value);
  final int value;

  String get title => "Your tile is $value";
}

class WhyProxyProvider extends StatefulWidget {
  const WhyProxyProvider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _whyProxyProvider();
}

class _whyProxyProvider extends State<WhyProxyProvider> {
  int count = 0;

  incrementCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<Translations>(
      create: (_) => Translations(count),
      child: Column(
        children: [
          ShowTransalation(),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => incrementCount(), child: Text("increment"))
        ],
      ),
    );
  }
}

class ShowTransalation extends StatelessWidget {
  ShowTransalation({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Provider.of<Translations>(context).title;
    return Text(title);
  }
}
