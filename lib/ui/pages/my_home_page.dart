import 'package:flutter/material.dart';

import '../widgets/detail_card_widget.dart';
import 'detail_page.dart';

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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            imageIndex: i,
                          ),
                        ));
                  },
                  child: DetailCardWidget(imageIndex: i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
