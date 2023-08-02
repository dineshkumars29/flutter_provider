import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_01/models/babies.dart';
import 'package:provider_overview_01/models/dog_03.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicati  on.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              Dog(breed: "Nattu naai", name: "Jonney", age: 3),
        ),
        FutureProvider<int>(
            initialData: 0,
            create: (context) {
              final dogAge = context.read<Dog>().age;
              final babies = Babies(age: dogAge);
              return babies.getBabies();
            }),
        StreamProvider<String>(
            initialData: "number of braking 0",
            create: (context) {
              final dogAge = context.read<Dog>().age;
              final babies = Babies(age: dogAge * 3);
              return babies.Bark();
            })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    'Dog name',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${context.watch<Dog>().name}",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BreedAndAge()
            ],
          ),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Breed Dog"),
            SizedBox(
              width: 10,
            ),
            Text(
              "${context.select<Dog, String>((Dog dog) => dog.breed)}",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Age()
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Age"),
            SizedBox(
              width: 10,
            ),
            Text(
              "${context.select<Dog, int>((Dog dog) => dog.age)}",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text("Babies Age ${context.watch<int>()}"),
        SizedBox(
          height: 20,
        ),
        Text("${context.watch<String>()}"),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () => context.read<Dog>().DogAgeIncrease(),
            child: Text("Age Increase"))
      ],
    );
  }
}
