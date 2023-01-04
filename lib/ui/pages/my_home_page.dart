import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const ListTile(
                title: Text('Ejemplo usando navigator 1.0'),
                subtitle: Text('Tambien usaremos Navigator 2.0'),
              ),
              for (int i = 1; i < 7; i++)
                Card(
                  child: Image.asset('assets/cat$i.png'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
