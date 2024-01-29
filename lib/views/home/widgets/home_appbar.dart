import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentent/services/theme_services.dart';

import '../../../models/user_model.dart';
import '../../../widgets/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.userModel});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning 👋';
      } else if (hour < 17) {
        return 'Good Afternoon 👋🏻';
      } else {
        return 'Good Evening 👋🏿';
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/app_icon/placeholder.png',
                  image: userModel != null
                      ? userModel!.profilePicture
                      : 'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/app_icon/placeholder.png');
                  },
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Visibility(
                  visible: userModel != null,
                  child: InkWell(
                    onTap: () {
                      // Get.to(() => const EditProfileScreen());
                    },
                    child: const Text(
                      'Edit Fullname',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                const Visibility(
                  visible: true,
                  // (userModel!.firstname != 'N/A' &&
                  //     userModel!.lastname != 'N/A'),
                  child: Text(
                    'Rayaan Yahaya',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            final ThemeServices themeServices = ThemeServices();
            themeServices.changeThemeMode();
          },
          icon: Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Iconsax.notification5,
                  color: kPrimaryColor,
                ),
                Positioned(
                  top: 0,
                  right: 2,
                  bottom: 15,
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    showBadge: true,
                    ignorePointer: false,
                    onTap: () {},
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: kErrorColor,
                      padding: EdgeInsets.all(5),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
