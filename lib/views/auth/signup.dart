import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../services/auth_services.dart';
import '../../widgets/aby_loading.dart';
import '../../widgets/constants.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_input.dart';
import 'login.dart';
import 'widgets/social_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthServices authServices = AuthServices();
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  // final TextEditingController phone = TextEditingController();
  final PhoneNumber phoneNumber = PhoneNumber(isoCode: 'GH');
  String? phone;
  String? isoCode;
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  bool isEmailFocused = false;
  bool isPhoneFocused = false;
  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;
  bool obsecureText = true;
  bool obsecureConfirm = true;

  @override
  Widget build(BuildContext context) {
    emailFocusNode.addListener(() {
      setState(() {
        isEmailFocused = emailFocusNode.hasFocus;
      });
    });
    phoneFocusNode.addListener(() {
      setState(() {
        isPhoneFocused = phoneFocusNode.hasFocus;
      });
    });
    passwordFocusNode.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocusNode.hasFocus;
      });
    });
    confirmPasswordFocusNode.addListener(() {
      setState(() {
        isConfirmPasswordFocused = confirmPasswordFocusNode.hasFocus;
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
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Theme.of(context).brightness == Brightness.light
                              ? Image.asset('assets/app_icon/logo.png',
                                  width: constraints.maxWidth < 768 ? 250 : 350)
                              : Image.asset('assets/app_icon/logo_white.png',
                                  width:
                                      constraints.maxWidth < 768 ? 250 : 350),
                          Text(
                            'Create an Account',
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
                                return '* Enter a valid email address';
                              } else if (value.isEmpty) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          AuthPhoneInput(
                            isFocused: isPhoneFocused,
                            focusNode: phoneFocusNode,
                            hintText: 'Phone Number',
                            prefixIcon: 'call.svg',
                            isEnabled: authServices.loading.isFalse,
                            phoneNumber: phoneNumber,
                            onInputChanged: (value) {
                              phone = value.phoneNumber;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "* Required";
                              } else if (value.length < 8) {
                                return "* Password must be at least 8 characters long";
                              } else {
                                return null;
                              }
                            },
                          ),
                          AuthTextInput(
                            isFocused: isConfirmPasswordFocused,
                            hintText: 'Confirm Password',
                            controller: confirmPassword,
                            isEnabled: authServices.loading.isFalse,
                            prefixIcon: 'lock.svg',
                            suffixIcon:
                                obsecureConfirm ? 'eye-slash.svg' : 'eye.svg',
                            focusNode: confirmPasswordFocusNode,
                            obscureText: obsecureConfirm ? true : false,
                            onTap: () {
                              setState(() {
                                obsecureConfirm = !obsecureConfirm;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "* Required";
                              } else if (value != password.text) {
                                return '* Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          authServices.loading.isFalse
                              ? PrimaryButton(
                                  onPressed: () {
                                    if (formKey!.currentState!.validate()) {
                                      // formKey!.currentState!.save();
                                      authServices.otpSend(
                                        phone: phone!.substring(1),
                                        email: email.text,
                                        password: password.text,
                                        confirmPassword: confirmPassword.text,
                                      );
                                      formKey!.currentState!.reset();
                                    }
                                  },
                                  label: 'Sign up',
                                )
                              : const AbyLoading(),
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
                      text: 'Already have an account?',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxWidth < 768 ? 12 : 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: Text(
                              ' Sign in',
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
