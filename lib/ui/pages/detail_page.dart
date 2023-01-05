import 'package:flutter/material.dart';

import '../widgets/detail_card_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.imageIndex,
  }) : super(key: key);

  final int imageIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(),
      body: Center(
        child: DetailCardWidget(
          imageIndex: imageIndex.clamp(1, 6),
        ),
      ),
    );
  }
}
