import 'package:flutter/material.dart';

class GalleryRow extends StatelessWidget {
  const GalleryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage.assetNetwork(
            height: 130,
            width: 130,
            placeholder: 'assets/app_icon/placeholder.png',
            image:
                'https://plus.unsplash.com/premium_photo-1661962841993-99a07c27c9f4?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8fDA%3D',
            placeholderFit: BoxFit.contain,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage.assetNetwork(
            height: 130,
            width: 130,
            placeholder: 'assets/app_icon/placeholder.png',
            image:
                'https://plus.unsplash.com/premium_photo-1661962841993-99a07c27c9f4?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8fDA%3D',
            placeholderFit: BoxFit.contain,
            fit: BoxFit.cover,
          ),
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.assetNetwork(
                height: 130,
                width: 130,
                placeholder: 'assets/app_icon/placeholder.png',
                image:
                    'https://plus.unsplash.com/premium_photo-1661962841993-99a07c27c9f4?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8fDA%3D',
                placeholderFit: BoxFit.contain,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: const Center(
                      child: Text(
                    '10+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
