import 'package:aleteonavigator/ui/pages/details_name_page.dart';
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
      routes: {
        MyHomePage.initialRouteName: (context) => const MyHomePage(),
        DetailsNamedPage.pageName: (context) => const DetailsNamedPage()
      },
      initialRoute: MyHomePage.initialRouteName,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
