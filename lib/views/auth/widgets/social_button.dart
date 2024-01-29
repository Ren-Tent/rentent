import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/constants.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.icon}) : super(key: key);
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Theme.of(context).brightness == Brightness.dark
              ? kDarkColor.withOpacity(0.3)
              : kDarkColor.withOpacity(0.1),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).brightness == Brightness.dark
            ? kDarkUnFocused
            : kLightBackgroundColor,
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
