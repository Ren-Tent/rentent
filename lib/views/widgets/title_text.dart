import 'package:flutter/material.dart';
import 'package:rentent/widgets/constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
    this.onPressed,
    this.buttonText,
  }) : super(key: key);
  final String text;
  final String? buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Visibility(
          visible: buttonText != null,
          child: buttonText == null
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: onPressed,
                  child: Text(
                    buttonText!,
                    style: const TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
