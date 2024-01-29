import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentent/views/home/home.dart';

import 'constants.dart';

// ignore: must_be_immutable
class BottomNavy extends StatefulWidget {
  BottomNavy({Key? key, this.page}) : super(key: key);
  int? page;

  @override
  State<BottomNavy> createState() => _BottomNavyState();
}

class _BottomNavyState extends State<BottomNavy> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.page == null ? 0 : widget.page!);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              widget.page == null
                  ? index = _currentIndex
                  : index = widget.page!;
            });
          },
          children: [
            const HomeScreen(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return BottomNavigationBar(
            currentIndex: widget.page ?? _currentIndex,
            onTap: (index) {
              setState(() {
                widget.page == null
                    ? _currentIndex = index
                    : widget.page = index;
              });
              _pageController!.jumpToPage(index);
            },
            selectedItemColor: kPrimaryColor,
            selectedLabelStyle: TextStyle(
              fontSize: constraints.maxWidth < 768 ? 12 : 20,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: constraints.maxWidth < 768 ? 12 : 20,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    colorFilter: const ColorFilter.mode(
                      kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/search-filled.svg',
                    colorFilter: ColorFilter.mode(
                      (_currentIndex == 0 || widget.page == 0)
                          ? kPrimaryColor
                          : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter: const ColorFilter.mode(
                      kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/home-filled.svg',
                    colorFilter: ColorFilter.mode(
                      (_currentIndex == 1 || widget.page == 1)
                          ? kPrimaryColor
                          : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/coupon.svg',
                    colorFilter: const ColorFilter.mode(
                      kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/coupon-filled.svg',
                    colorFilter: ColorFilter.mode(
                      (_currentIndex == 2 || widget.page == 2)
                          ? kPrimaryColor
                          : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'Coupons',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    colorFilter: const ColorFilter.mode(
                      kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/settings-filled.svg',
                    colorFilter: ColorFilter.mode(
                      (_currentIndex == 3 || widget.page == 3)
                          ? kPrimaryColor
                          : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
