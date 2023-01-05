import 'package:flutter/material.dart';

class DetailCardWidget extends StatelessWidget {
  const DetailCardWidget({
    Key? key,
    required this.imageIndex,
  }) : super(key: key);

  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset('assets/cat${imageIndex.clamp(1, 6)}.png'),
    );
  }
}
