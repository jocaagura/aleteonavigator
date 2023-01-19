import 'package:flutter/material.dart';

import '../widgets/detail_card_widget.dart';

class DetailFromUrlPage extends StatelessWidget {
  static const routeName = '/image/';
  const DetailFromUrlPage({
    Key? key,
    required this.imageIndex,
  }) : super(key: key);

  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: const Text('Usaste Nav 1.0 desde Nav 2.0'),
      ),
      body: Center(
        child: DetailCardWidget(
          imageIndex: imageIndex.clamp(1, 6),
        ),
      ),
    );
  }
}
