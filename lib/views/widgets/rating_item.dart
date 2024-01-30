import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/constants.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: const Row(
              children: [
                Icon(
                  Iconsax.star1,
                  size: 15,
                  color: Colors.amber,
                ),
                SizedBox(width: 5),
                Text(
                  '4.5',
                  style: TextStyle(
                    fontSize: 12,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
