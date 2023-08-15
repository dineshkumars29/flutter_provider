import 'package:flutter/material.dart';
import 'package:provider_overview_01/models/dog_03.dart';

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
  final dog = Dog(name: "Joney", breed: "Nattu", age: 3);
  @override
  void initState() {
    super.initState();
    dog.addListener(dogAgeListener);
  }

  void dogAgeListener() {
    print("${dog.age}");
  }

  @override
  void dispose() {
    dog.removeListener(dogAgeListener);
    super.dispose();
  }

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
            //   mainAxisAlignment: MainAxisAlignment.center,
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
                    "${dog.name}",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BreedAndAge(
                dog: dog,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({super.key, required this.dog});

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
              "${dog.breed}",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Age(dog: dog)
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;
  const Age({super.key, required this.dog});
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
              "${dog.age}",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () => dog.DogAgeIncrease(), child: Text("Age Increase"))
      ],
    );
  }
}
