import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/constants.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage.assetNetwork(
                  height: 70,
                  width: 70,
                  placeholder: 'assets/app_icon/placeholder.png',
                  image:
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fHww',
                  placeholderFit: BoxFit.contain,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abdul Hanan Yahaya',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Chip(label: Text('Owner')),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.message,
                  size: 40,
                  color: kPrimaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.call,
                  size: 40,
                  color: kPrimaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
