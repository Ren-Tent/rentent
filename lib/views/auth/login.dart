import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentent/views/auth/signup.dart';
import 'package:rentent/widgets/bottom_navy.dart';

import '../../services/auth_services.dart';
import '../../widgets/aby_loading.dart';
import '../../widgets/constants.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_input.dart';
import 'forgot_password.dart';
import 'widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices authServices = AuthServices();
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    emailFocusNode.addListener(() {
      setState(() {
        isEmailFocused = emailFocusNode.hasFocus;
      });
    });

    passwordFocusNode.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocusNode.hasFocus;
      });
    });
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth < 768 ? 20 : 250),
          child: Stack(
            children: [
              Obx(
                () => Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(height: 50),
                          Theme.of(context).brightness == Brightness.light
                              ? Image.asset('assets/app_icon/logo.png',
                                  width: constraints.maxWidth < 768 ? 250 : 350)
                              : Image.asset('assets/app_icon/logo_white.png',
                                  width:
                                      constraints.maxWidth < 768 ? 250 : 350),
                          Text(
                            'Login to your Account',
                            style: TextStyle(
                              fontSize: constraints.maxWidth < 768 ? 20 : 25,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Form Field
                          AuthTextInput(
                            isFocused: isEmailFocused,
                            hintText: 'Email',
                            controller: email,
                            prefixIcon: 'mail.svg',
                            focusNode: emailFocusNode,
                            isEnabled: authServices.loading.isFalse,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              String pattern =
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?)*$";
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value!)) {
                                return 'Enter a valid email address';
                              } else if (value.isEmpty) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          AuthTextInput(
                            isFocused: isPasswordFocused,
                            hintText: 'Password',
                            controller: password,
                            isEnabled: authServices.loading.isFalse,
                            prefixIcon: 'lock.svg',
                            suffixIcon:
                                obsecureText ? 'eye-slash.svg' : 'eye.svg',
                            focusNode: passwordFocusNode,
                            obscureText: obsecureText ? true : false,
                            onTap: () {
                              setState(() {
                                obsecureText = !obsecureText;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          authServices.loading.isFalse
                              ? PrimaryButton(
                                  onPressed: () {
                                    // final ThemeServices themeServices =
                                    //     ThemeServices();
                                    // themeServices.changeThemeMode();
                                    Get.to(() => BottomNavy());
                                    // if (formKey!.currentState!.validate()) {
                                    //   formKey!.currentState!.save();
                                    //   authServices.login(
                                    //     // phone: phone!.substring(1),
                                    //     email: email.text,
                                    //     password: password.text,
                                    //   );
                                    //   formKey!.currentState!.reset();
                                    // }
                                  },
                                  label: 'Sign in',
                                )
                              : const AbyLoading(),
                          SizedBox(
                              height: constraints.maxWidth < 768 ? 20 : 40),
                          InkWell(
                            onTap: () {
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: constraints.maxWidth < 768 ? 15 : 20,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 0.5, width: 100, color: kDarkColor),
                            const Text('or continue with'),
                            Container(
                                height: 0.5, width: 100, color: kDarkColor),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SocialButton(icon: 'assets/icons/google.svg'),
                            SocialButton(icon: 'assets/icons/apple.svg'),
                            SocialButton(icon: 'assets/icons/facebook.svg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxWidth < 768 ? 12 : 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const SignupScreen());
                            },
                            child: Text(
                              ' Sign up',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: constraints.maxWidth < 768 ? 12 : 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
