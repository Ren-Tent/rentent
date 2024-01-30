import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentent/views/home/detail_screen.dart';
import 'package:rentent/views/widgets/rating_item.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          Get.to(() => const DetailScreen());
        },
        child: SizedBox(
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: [
                FadeInImage.assetNetwork(
                  height: 300,
                  placeholder: 'assets/app_icon/placeholder.png',
                  image:
                      'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8fDA%3D',
                  placeholderFit: BoxFit.contain,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 20,
                  bottom: 20,
                  child: SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 Bedroom Apartment',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Ward K, Tamale',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Ghc 1000.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '/month',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const RatingItem(),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.heart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
