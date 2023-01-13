import 'package:flutter/material.dart';

import '../../entities/image_index_entity.dart';
import 'detail_page.dart';

class DetailsNamedPage extends StatelessWidget {
  const DetailsNamedPage({Key? key}) : super(key: key);
  static const pageName = '/detail';

  @override
  Widget build(BuildContext context) {
    final ImageIndexArgument imageIndex =
        ModalRoute.of(context)?.settings.arguments as ImageIndexArgument;
    return DetailsPage(imageIndex: imageIndex.indexImage);
  }
}
