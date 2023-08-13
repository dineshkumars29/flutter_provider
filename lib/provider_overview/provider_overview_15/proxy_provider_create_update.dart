import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  late int value;

  void update(int newValue) {
    value = newValue;
  }

  String get title => "Your tile is $value";
}

class ProxyProviderCreateUpdate extends StatefulWidget {
  const ProxyProviderCreateUpdate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProxyProviderCreateUpdate();
}

class _ProxyProviderCreateUpdate extends State<ProxyProviderCreateUpdate> {
  int count = 0;

  incrementCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProxyProvider0<Translations>(
      update: (_, Translations? translations) {
        translations!.update(count);
        return translations;
      },
      create: (_) => Translations(),
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
