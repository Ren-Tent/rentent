import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentent/views/widgets/gallery_row.dart';
import 'package:rentent/views/widgets/property_item.dart';
import 'package:rentent/views/widgets/review_item.dart';
import 'package:rentent/widgets/constants.dart';

import '../widgets/primary_button.dart';
import '../widgets/user_card.dart';
import 'widgets/detail_appbar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aG91c2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGhvdXNlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGhvdXNlfGVufDB8fDB8fHww',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : kDarkUnFocused,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price'),
                    Row(
                      children: [
                        Text(
                          'Ghc12,000.00',
                          style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text('/month'),
                      ],
                    ),
                  ],
                ),
              ),
              ShortPrimaryButton(
                width: 150,
                label: 'Rent',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: Get.size.width / 1.4,
            pinned: true,
            stretch: true,
            actions: [
              IconButton(
                icon: const Icon(Iconsax.heart),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Iconsax.direct_send),
                onPressed: () {},
              ),
            ],
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness:
                  Theme.of(context).brightness == Brightness.light
                      ? Brightness.light
                      : Brightness.dark,
            ),
            flexibleSpace: DetailScreenAppBar(imgList: imgList),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.size.width - 20,
                    child: const Text(
                      '2 Bedroom  Apartment as Katariga Yapala-Just behind the central mosque, 200m away.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Chip(label: Text('Apartment')),
                        Icon(Iconsax.star1, color: Colors.amber, size: 35),
                        Text(
                          '4.5 (1,523 reviews)',
                          style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PropertyItem(
                          icon: 'assets/icons/bed.svg',
                          label: '2 Bed Rooms',
                        ),
                        SizedBox(width: 5),
                        PropertyItem(
                          icon: 'assets/icons/bath.svg',
                          label: '3 Baths',
                        ),
                        SizedBox(width: 5),
                        PropertyItem(
                          icon: 'assets/icons/pool.svg',
                          label: '1 Kitchen',
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const UserCard(),
                  const Divider(),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text.rich(
                    TextSpan(
                      text:
                          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet mon ',
                      children: [
                        WidgetSpan(
                          child: Text(
                            'Read More...',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const GalleryRow(),
                  const SizedBox(height: 10),
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              color: kPrimaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Ward K, Tamale',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage.assetNetwork(
                            height: 170,
                            width: Get.width,
                            placeholder: 'assets/app_icon/placeholder.png',
                            image:
                                'https://images.unsplash.com/photo-1569336415962-a4bd9f69cd83?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG1hcHxlbnwwfHwwfHx8MA%3D%3D',
                            placeholderFit: BoxFit.contain,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'see all',
                              style: TextStyle(
                                fontSize: 12,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const ReviewItem();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
