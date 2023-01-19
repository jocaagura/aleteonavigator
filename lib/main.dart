import 'package:aleteonavigator/ui/navigator/my_navigator_widget.dart';
import 'package:flutter/material.dart';

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
    return MyNavigatorWidget(
      themeData: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
