import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/constants.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : kDarkUnFocused,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage.assetNetwork(
                        height: 50,
                        width: 50,
                        placeholder: 'assets/app_icon/placeholder.png',
                        image:
                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fHww',
                        placeholderFit: BoxFit.contain,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Abdul Hanan Yahaya',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Iconsax.star1,
                                size: 15,
                                color: kPrimaryColor,
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.more),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'The apartment is very nice, clean and modern. I really like the interior design. Looks like I’ll feel at home. The apartment is very nice, clean and modern.',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.heart,
                        color: kPrimaryColor,
                      ),
                    ),
                    const Text('2,452'),
                  ],
                ),
                const Text('6 days ago')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
