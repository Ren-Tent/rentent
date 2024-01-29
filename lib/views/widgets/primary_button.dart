import 'package:flutter/material.dart';

import '../../widgets/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          minimumSize:
              MaterialStateProperty.all<Size>(const Size(double.infinity, 60)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ShortPrimaryButton extends StatelessWidget {
  const ShortPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.width,
    this.verticalPadding,
  }) : super(key: key);
  final String label;
  final void Function()? onPressed;
  final double width;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding ?? 20),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(width, 60)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ShortSecondaryButton extends StatelessWidget {
  const ShortSecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.width,
    this.verticalPadding,
  }) : super(key: key);
  final String label;
  final void Function()? onPressed;
  final double width;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding ?? 20),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(kPrimaryColor),
          backgroundColor:
              MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size(width, 60)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
