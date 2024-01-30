import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/constants.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: kPrimarySecondaryColor,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(icon, width: 25),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
