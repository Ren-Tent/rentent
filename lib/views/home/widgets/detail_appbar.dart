import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/constants.dart';

class DetailScreenAppBar extends StatefulWidget {
  const DetailScreenAppBar({Key? key, required this.imgList}) : super(key: key);
  final List<String> imgList;

  @override
  State<DetailScreenAppBar> createState() => _DetailScreenAppBarState();
}

class _DetailScreenAppBarState extends State<DetailScreenAppBar> {
  int current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: widget.imgList
                    .map(
                      (item) => Stack(
                        children: [
                          FadeInImage.assetNetwork(
                            height: Get.size.width / 1.17,
                            width: MediaQuery.of(context).size.width,
                            placeholder: 'assets/app_icon/placeholder.png',
                            image: item,
                            placeholderFit: BoxFit.contain,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.3, 1.0, 1.5],
                                  colors: [
                                    Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.black.withOpacity(0.5),
                                    Colors.white.withOpacity(0.0),
                                    Colors.black.withOpacity(0.5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    viewportFraction: 1,
                    disableCenter: true,
                    height: Get.size.width / 1.175,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    }),
              ),
              // const DetailScreenAppBar(),
              Align(
                // alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: current == entry.key
                                  ? kPrimaryColor
                                  : Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      stretchModes: const [
        StretchMode.blurBackground,
        StretchMode.zoomBackground,
      ],
    );
  }
}
