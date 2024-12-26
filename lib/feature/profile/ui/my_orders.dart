import 'package:flutter/material.dart';

import '../../../core/widgets/products_list.dart';
import '../../../core/functions/build_appbar.dart';


class MyOrdersViwe extends StatelessWidget {
  const MyOrdersViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "My Orders"),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductsList(
          shrinkWrap: false,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}