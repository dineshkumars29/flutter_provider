import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/counter.dart';

class ShowCount extends StatelessWidget {
  const ShowCount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                'Count : ${context.watch<Counter>().counter}',
                style: TextStyle(color: Colors.red),
              ),
            )));
  }
}
