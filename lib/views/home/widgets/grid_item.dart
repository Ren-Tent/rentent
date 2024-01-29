import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/constants.dart';

class GridItem extends StatelessWidget {
  const GridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).brightness == Brightness.light
            ? kLightCard
            : kDarkUnFocused,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage.assetNetwork(
                  height: 180,
                  placeholder: 'assets/app_icon/placeholder.png',
                  image:
                      'https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aG91c2V8ZW58MHx8MHx8fDA%3D',
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                '2 Bed Apartment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Ward K, Tamale',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              const Row(
                children: [
                  Text(
                    'Ghc 1000.00',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/month',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.heart,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
