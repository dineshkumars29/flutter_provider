import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_17/app_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (BuildContext context) => AppProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  var searchItem = "";

  void submit() async {
    setState(() {
      autoValidate = AutovalidateMode.always;
    });

    var form = formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();

    context.read<AppProvider>().getResult(context, searchItem);

//! progress 1
    // try {
    //   await context.read<AppProvider>().getResult(searchItem);
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SuccessPage()));
    // } catch (value) {
    //   return showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //             content: Column(
    //                 children: [Text("Good Day. but have some errors occures")]),
    //           ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppProvider>().State;

    //! Progress 2
    // if (appState == AppState.success) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SuccessPage()));
    // });
    // } else if (appState == AppState.error) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     showDialog(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //               content: Column(children: [
    //                 Text("Good Day. but have some errors occures")
    //               ]),
    //             ));
    //   });
    // }

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: Form(
                key: formKey,
                autovalidateMode: autoValidate,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty || value.trim().toString().isEmpty) {
                          return "Search Item Required";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? value) {
                        searchItem = value!;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: appState == AppState.loading ? null : submit,
                        child: Text(appState == AppState.loading
                            ? "loading"
                            : "Get Result"))
                  ],
                ))),
      ),
    );
  }
}
