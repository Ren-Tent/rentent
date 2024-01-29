import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rentent/views/home/widgets/featured_item.dart';
import 'package:rentent/views/home/widgets/home_appbar.dart';
import 'package:rentent/views/widgets/text_input.dart';
import 'package:rentent/views/widgets/title_text.dart';
import 'package:rentent/widgets/constants.dart';

import 'widgets/grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  final TextEditingController search = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool isSearchFocused = false;
  final List<String> tagList = [
    'All',
    'House',
    'Rooms',
    'Villa',
  ];
  @override
  Widget build(BuildContext context) {
    searchFocusNode.addListener(() {
      setState(() {
        isSearchFocused = searchFocusNode.hasFocus;
      });
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const HomeAppBar(userModel: null),
            SearchTextField(
              isFocused: isSearchFocused,
              focusNode: searchFocusNode,
              prefixIcon: 'search.svg',
              hintText: 'Search',
              controller: search,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: tagList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              tagList[index],
                              style: const TextStyle(
                                fontSize: 17,
                                color: kPrimaryColor,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
                  },
                ),
              ),
            ),
            const TitleText(text: 'Featured', buttonText: 'See all'),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const FeaturedItem();
                },
              ),
            ),
            const TitleText(text: 'Recommendations', buttonText: 'See all'),
            MasonryGridView.count(
              padding: const EdgeInsets.all(0),
              crossAxisCount: 2,
              itemCount: 4,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              mainAxisSpacing: 10,
              itemBuilder: (context, index) {
                return const GridItem();
              },
            )
          ],
        ),
      ),
    );
  }
}
