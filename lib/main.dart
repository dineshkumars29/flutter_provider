import 'package:flutter/material.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_15/changenotifiprov_proxyprov.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_15/proxy_provider_change_notifier.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_15/proxy_provider_create_update.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_15/proxy_provider_multiple.dart';
import 'package:provider_overview_01/provider_overview/provider_overview_15/proxy_provider_update.dart';

import 'provider_overview/provider_overview_15/why_proxy_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "hello man",
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => WhyProxyProvider()));
                  },
                  child: Text("Why Provider"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProxyProviderUpdate()));
                  },
                  child: Text("proxyProvider update"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProxyProviderCreateUpdate()));
                  },
                  child: Text("Proxy Provider Create-Update"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProxyProviderMultiProvider()));
                  },
                  child: Text("Proxy Provider with Multi Provider"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ProxyProviderusingChangeNotifier()));
                  },
                  child: Text("Proxy Provider using ChangeNotifier"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => changeNotiProvAndProxyProvider()));
                  },
                  child: Text("ChangeNotifier vs Proxy Provider"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
