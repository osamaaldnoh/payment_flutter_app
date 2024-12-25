import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    leading: const Icon(
      Icons.arrow_back_outlined,
      color: Colors.black,
    ),
    title: Text(
      title ?? '',
      style: Styles.style25,
    ),
  );
}
