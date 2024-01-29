import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AbyLoading extends StatelessWidget {
  const AbyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/loading_animation.json',
        repeat: true,
      ),
    );
  }
}
