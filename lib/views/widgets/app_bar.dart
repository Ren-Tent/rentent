import 'package:flutter/material.dart';

import '../../widgets/constants.dart';

AppBar appBar({required String title, List<Widget>? actions, Widget? leading}) {
  return AppBar(
    leading: leading,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    centerTitle: false,
    elevation: 0,
    backgroundColor: kPrimaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: actions,
  );
}
