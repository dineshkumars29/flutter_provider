import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicati  on.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CounterA(counter: counter, increment: increment),
            const SizedBox(
              height: 20,
            ),
            Middle(
              counter: counter,
              increment: increment,
            ),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final void Function() increment;
  const CounterA({super.key, required this.counter, required this.increment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(children: [
        Text("$counter"),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: increment, child: const Text("click here"))
      ]),
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;
  final void Function() increment;
  const Middle({super.key, required this.counter, required this.increment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          CounterB(
            counter: counter,
          ),
          const Siblings()
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  final int counter;
  const CounterB({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text("$counter");
  }
}

class Siblings extends StatelessWidget {
  const Siblings({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("Siblings");
  }
}
