import 'package:aleteonavigator/main.dart';
import 'package:flutter/material.dart';

import '../widgets/detail_card_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const initialRouteName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const ListTile(
                title: Text('Ejemplo usando navigator 2.0'),
                subtitle: Text('Aqui ya no usaremos Navigator 1.0'),
              ),
              for (int i = 1; i < 7; i++)
                InkWell(
                  onTap: () {
                    context
                        .findAncestorStateOfType<MyAppState>()
                        ?.setImageIndex(i);
                    //Navigator.pushNamed(
                    //  context,
                    //  DetailsNamedPage.pageName,
                    //  arguments: ImageIndexArgument(indexImage: i),
                    //);
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
