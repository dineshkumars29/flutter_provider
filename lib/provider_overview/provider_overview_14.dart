import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_01.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_12/show_counter_value.dart';

import '../../models/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Counter _counter = Counter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      // home: ChangeNotifierProvider(
      //     create: (BuildContext context) => Counter(), child: HomePage()),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   "/": (context) =>
      //       ChangeNotifierProvider.value(value: _counter, child: HomePage()),
      //   "/counter": (context) =>
      //       ChangeNotifierProvider.value(value: _counter, child: ShowCount())
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                      value: _counter,
                      child: HomePage(),
                    ));
          case '/counter':
            return MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                    value: _counter, child: ShowCount()));
          default:
            return null;
        }
      },
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
                    Navigator.pushNamed(context, "/counter");
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
