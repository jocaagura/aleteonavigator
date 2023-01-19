import 'package:flutter/material.dart';

import '../navigator/my_navigator_widget.dart';
import '../widgets/detail_card_widget.dart';
import 'detail_from_url_page.dart';

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
                    final myRouterDelegate = context
                        .findAncestorStateOfType<MyNavigatorWidgetState>()
                        ?.myRouterDelegate;

                    myRouterDelegate?.setNewRoutePath(
                      Uri.parse('${DetailFromUrlPage.routeName}$i'),
                    );
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
