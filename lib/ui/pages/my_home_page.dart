import 'package:aleteonavigator/entities/image_index_entity.dart';
import 'package:aleteonavigator/ui/pages/details_name_page.dart';
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
                title: Text('Ejemplo usando navigator 1.0'),
                subtitle: Text('Tambien usaremos Navigator 2.0'),
              ),
              for (int i = 1; i < 7; i++)
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailsNamedPage.pageName,
                      arguments: ImageIndexArgument(indexImage: i),
                    );
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
