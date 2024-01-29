import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../services/auth_services.dart';
import '../../widgets/constants.dart';
import '../widgets/primary_button.dart';
import 'new_password.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
    required this.phone,
    required this.email,
    this.password,
    this.confirmPassword,
  }) : super(key: key);
  final String phone;
  final String email;
  final String? password;
  final String? confirmPassword;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final AuthServices authServices = AuthServices();
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  final TextEditingController otpCode = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  bool isEmailFocused = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth < 768 ? 20 : 250),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confirm OTP 📩',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'We have sent the OTP code to your phone number or email address. Check your phone number or email and enter the code below.',
                        style: TextStyle(
                            fontSize: constraints.maxWidth < 768 ? 12 : 17),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.phone,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxWidth < 768 ? 15 : 25,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              otpCode.clear();
                              if (widget.password == null ||
                                  widget.confirmPassword == null) {
                                authServices.otpSend(
                                  phone: widget.phone,
                                  email: widget.email,
                                  resetPassword: '1',
                                );
                              } else {
                                authServices.otpSend(
                                  phone: widget.phone,
                                  email: widget.email,
                                  password: widget.password,
                                  confirmPassword: widget.confirmPassword,
                                );
                              }
                            },
                            child: Text(
                              ' Resend Code?',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                                fontSize: constraints.maxWidth < 768 ? 15 : 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Pinput(
                        controller: otpCode,
                        defaultPinTheme: PinTheme(
                          height: constraints.maxWidth < 768 ? 60 : 70,
                          width: constraints.maxWidth < 768 ? 56 : 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFF2F2F7),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          height: constraints.maxWidth < 768 ? 60 : 70,
                          width: constraints.maxWidth < 768 ? 56 : 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: kPrimaryColor),
                            color: const Color(0xFFF2F2F7),
                          ),
                        ),
                        onCompleted: (value) {
                          if (widget.password == null ||
                              widget.confirmPassword == null) {
                            Get.to(() => CreateNewPasswordScreen(
                                  otpCode: otpCode.text,
                                  phone: widget.phone,
                                ));
                          } else {
                            authServices.signup(
                              email: widget.email,
                              phone: widget.phone,
                              password: widget.password!,
                              confirmPassword: widget.confirmPassword!,
                              otp: value,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  label: 'Continue',
                  onPressed: () {
                    if (formKey!.currentState!.validate()) {
                      formKey!.currentState!.save();
                      // my function here
                      if (widget.password == null ||
                          widget.confirmPassword == null) {
                      } else {
                        authServices.signup(
                          email: widget.email,
                          phone: widget.phone,
                          password: widget.password!,
                          confirmPassword: widget.confirmPassword!,
                          otp: otpCode.text,
                        );
                      }
                      formKey!.currentState!.reset();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
