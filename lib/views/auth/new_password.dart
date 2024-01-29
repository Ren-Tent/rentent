import 'package:flutter/material.dart';
import 'package:rentent/services/auth_services.dart';

import '../widgets/primary_button.dart';
import '../widgets/text_input.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen(
      {Key? key, required this.otpCode, required this.phone})
      : super(key: key);
  final String otpCode;
  final String phone;

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final AuthServices authServices = AuthServices();
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;
  bool obsecureText = true;
  bool obsecureTextConfirm = true;
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
                      'Create New Password 🔐',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enter your new password. If you forget it,  then you have to do forgot password.',
                      style: TextStyle(
                        fontSize: constraints.maxWidth < 768 ? 12 : 17,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // new password
                    AuthTextInput(
                      isFocused: isPasswordFocused,
                      hintText: 'Password',
                      controller: password,
                      isEnabled: true,
                      prefixIcon: 'lock.svg',
                      suffixIcon: obsecureText ? 'eye-slash.svg' : 'eye.svg',
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
                    // confirm new password
                    AuthTextInput(
                      isFocused: isConfirmPasswordFocused,
                      hintText: 'Confirm Password',
                      controller: confirmPassword,
                      prefixIcon: 'lock.svg',
                      isEnabled: true,
                      suffixIcon:
                          obsecureTextConfirm ? 'eye-slash.svg' : 'eye.svg',
                      focusNode: confirmPasswordFocusNode,
                      obscureText: obsecureTextConfirm ? true : false,
                      onTap: () {
                        setState(() {
                          obsecureTextConfirm = !obsecureTextConfirm;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "* Required";
                        } else if (value != password.text) {
                          return "* Confirm password is not same as password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              )),
              Container(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  label: 'Continue',
                  onPressed: () {
                    if (formKey!.currentState!.validate()) {
                      formKey!.currentState!.save();
                      // my function here
                      authServices.passwordReset(
                        password: password.text,
                        confirmPassword: confirmPassword.text,
                        phone: widget.phone,
                        otpCode: widget.otpCode,
                      );
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
