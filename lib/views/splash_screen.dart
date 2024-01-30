import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  final localStorage = GetStorage();

  @override
  void initState() {
    _checkIfLoggedIn();
    startTime();

    super.initState();
  }

  // final AuthServices authServices = AuthServices();
  void _checkIfLoggedIn() async {
    // check if token is there
    var token = localStorage.read('token');
    if (token != null) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  // / Setting duration in splash screen
  startTime() async {
    return Timer(const Duration(seconds: 3), navigatorPage);
  }

  final AuthController userController = Get.find();

  /// To navigate layout change
  void navigatorPage() async {
    final authData = await userController.getAuthUser();

    Get.offAllNamed(
      isLoggedIn
          ? authData.user != null
              ? "bottomNavy"
              : authData.other != null
                  ? authData.other['message'] == 'Unauthenticated'
                      ? 'login'
                      : 'nointernet'
                  : "nointernet"
          : "login",
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      Theme.of(context).brightness == Brightness.light
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
    );
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Container(
                // height: constraints.maxWidth < 768 ? 150 : 250,
                width: constraints.maxWidth < 768 ? 250 : 350,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Theme.of(context).brightness == Brightness.light
                        ? const AssetImage('assets/app_icon/logo.png')
                        : const AssetImage('assets/app_icon/logo_white.png'),
                  ),
                ),
              ),
            ),
            Lottie.asset(
              'assets/animations/loading_animation.json',
              repeat: true,
            ),
            const SizedBox(height: 20),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              // alignment: Alignment.bottomCenter,
              child: Text(
                'Rentent © ${DateTime.now().year}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        );
      }),
    );
  }
}
