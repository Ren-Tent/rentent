import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'constants.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.prescriptionName,
    required this.prescriptionId,
  }) : super(key: key);
  final String prescriptionName;
  final String prescriptionId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height:
            Get.size.width < 176 ? Get.size.height / 4 : Get.size.height / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Alert!',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(50),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: SvgPicture.asset('assets/icons/shield_tick.svg'),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width / 1.8,
              child: Text(
                'Are you sure you want to proceed and send the prescription titled \'$prescriptionName\' to FyndRx for interpretation?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkColor.withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(kSecondaryColor.withOpacity(.3)),
            foregroundColor: const MaterialStatePropertyAll(kSecondaryColor),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text(
            'Proceed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
