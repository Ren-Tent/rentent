import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/constants.dart';

AppBar naviAppBar({required String title}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset('assets/icons/fyndrx-logo.svg'),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 25,
        fontWeight: FontWeight.w900,
      ),
    ),
    centerTitle: false,
  );
}
