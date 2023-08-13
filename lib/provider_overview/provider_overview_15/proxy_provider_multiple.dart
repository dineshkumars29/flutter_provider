import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  Translations(this.value);
  int value;
  // late int value;
  // void update(int newValue) {
  //   value = newValue;
  // }

  String get title => "Your tile is $value";
}

class ProxyProviderMultiProvider extends StatefulWidget {
  const ProxyProviderMultiProvider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProxyProviderMultiProvider();
}

class _ProxyProviderMultiProvider extends State<ProxyProviderMultiProvider> {
  int count = 0;

  incrementCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ProxyProvider0<int>(update: (_, __) => count),
        ProxyProvider<int, Translations>(
            update: (_, value, __) => Translations(value))
      ],
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
    final String title = context.watch<Translations>().title;
    return Text(title);
  }
}
