import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class Foo with ChangeNotifier {
  String value = "foo";

  void check() {
    value = value == 'foo' ? "boo" : "foo";
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (BuildContext context) => Foo(),
          //! using Consumer

          // child: Consumer<Foo>(
          //   builder: (BuildContext context, Foo foo, Widget? child) {
          //     return Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Column(children: [
          //         Row(
          //           children: [
          //             Text("value is"),
          //             Text(" ${foo.value}"),
          //           ],
          //         ),
          //         ElevatedButton(
          //             onPressed: () {
          //               foo.check();
          //             },
          //             child: Text("check values"))
          //       ]),
          //     );
          //   },
          // ),

          //! using normal provider

          child: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  children: [
                    Text("value is"),
                    Text(" ${context.watch<Foo>().value}"),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<Foo>().check();
                    },
                    child: Text("check values"))
              ]),
            );
          }),
        ),
      ),
    );
  }
}
