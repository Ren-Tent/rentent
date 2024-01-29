import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';

import '../../services/auth_services.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthServices authServices = AuthServices();
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  bool isEmailFocused = false;

  final PhoneNumber phoneNumber = PhoneNumber(isoCode: 'GH');
  String? phone;
  String? isoCode;
  final FocusNode phoneFocusNode = FocusNode();
  bool isPhoneFocused = false;
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
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth < 768 ? 20 : 250),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forgot Password 🔑',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enter your email address. We will send an OTP code for verification in the next step.',
                      style: TextStyle(
                        fontSize: constraints.maxWidth < 768 ? 12 : 17,
                      ),
                    ),
                    const SizedBox(height: 30),
                    AuthTextInput(
                      isFocused: isEmailFocused,
                      hintText: 'Email',
                      controller: email,
                      isEnabled: authServices.loading.isFalse,
                      prefixIcon: 'mail.svg',
                      focusNode: emailFocusNode,
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
                    AuthPhoneInput(
                      isFocused: isPhoneFocused,
                      focusNode: phoneFocusNode,
                      hintText: '000 000 0000',
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
                  ],
                ),
                authServices.loading.isFalse
                    ? Container(
                        alignment: Alignment.bottomCenter,
                        child: PrimaryButton(
                          onPressed: () {
                            if (formKey!.currentState!.validate()) {
                              // formKey!.currentState!.save();
                              authServices.otpSend(
                                phone: phone!.substring(1),
                                email: email.text,
                                resetPassword: '1',
                              );
                              formKey!.currentState!.reset();
                            }
                          },
                          label: 'Continue',
                        ),
                      )
                    : Container(
                        alignment: Alignment.bottomCenter,
                        child: Lottie.asset(
                          'assets/animations/95944-loading-animation.json',
                          repeat: true,
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
