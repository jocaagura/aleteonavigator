import 'package:flutter/material.dart';

import 'ui/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo navigator',
      home: Navigator(
        onPopPage: (route, result) {
          debugPrint(route.toString());
          debugPrint(result.toString());
          return route.didPop(result);
        },
        pages: const [
          MaterialPage(
            child: MyHomePage(),
          )
        ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
