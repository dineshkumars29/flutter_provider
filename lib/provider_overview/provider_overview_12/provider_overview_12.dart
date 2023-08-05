import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_12/show_counter_value.dart';

import '../../models/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (BuildContext context) => Counter(), child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  child: Text("show count"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider.value(
                              value: context.read<Counter>(),
                              child: ShowCount()),
                        ));
                  }),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<Counter>().increaseCounter();
                  },
                  child: Text("Click to increase count"))
            ],
          ),
        ),
      ),
    );
  }
}
