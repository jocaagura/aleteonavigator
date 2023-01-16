import 'package:flutter/material.dart';

import 'ui/pages/detail_page.dart';
import 'ui/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int? imageIndex;
  void setImageIndex(int i) {
    setState(() {
      imageIndex = i;
    });
  }

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
        pages: [
          const MaterialPage(child: MyHomePage(), name: "Home page"),
          if (imageIndex != null)
            MaterialPage(
              child: DetailsPage(
                imageIndex: imageIndex ?? 1,
              ),
            )
        ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
