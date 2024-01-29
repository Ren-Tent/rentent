import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rentent/services/server.dart';

import '../controllers/auth_controller.dart';
import '../models/user_model.dart';
import '../widgets/aby_snackbar.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/status_dialog.dart';

class AuthServices {
  var loading = false.obs;
  final localStorage = GetStorage();
  Future<bool> login({required String email, required String password}) async {
    try {
      loading(true);

      final response = await http.post(
        Uri.parse(
            '$protocol$baseUrl/auth/login?login=$email&password=$password'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        loading(false);

        localStorage.write('token', jsonDecode(response.body)['access_token']);

        final AuthController userController = Get.find();
        final getUser = await userController.getAuthUser();
        if (getUser.user != null) {
          // Get.offAll(() => BottomNavy());

          if (getUser.user!.firstname == 'N/A' &&
              getUser.user!.lastname == 'N/A') {
            AbySnackBar.successSnackbar(text: 'Welcome to FyndRx');
          } else {
            AbySnackBar.successSnackbar(
                text:
                    'Welcome ${getUser.user!.firstname} ${getUser.user!.lastname}');
          }
        } else {
          AbySnackBar.warningSnackbar(text: 'Couldn\'t login, trying again.');
        }
        return true;
      } else if (response.statusCode == 401) {
        loading(false);
        AbySnackBar.warningSnackbar(text: 'Invalid Login Credentials');
        return false;
      } else {
        loading(false);
        AbySnackBar.errorSnackbar(
            text: 'Request failed with status: ${response.statusCode}.');
        return false;
      }
      // } else {
      //   loading(false);
      //   AbySnackBar.errorSnackbar(
      //       text: 'Please check your internet connection');
      //   return false;
      // }
    } on SocketException catch (_) {
      loading(false);
      AbySnackBar.errorSnackbar(text: 'Please check your internet connection');
      return false;
    }
  }

  Future<bool> otpSend({
    required String phone,
    required String email,
    String? password,
    String? confirmPassword,
    String? resetPassword,
  }) async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    try {
      final response = await http.post(
        Uri.parse(
            '$protocol$baseUrl/auth/user-otp-send?email=$email&phone_number=$phone&reset_password=$resetPassword'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        Navigator.of(Get.overlayContext!).pop();
        AbySnackBar.successSnackbar(text: 'OTP Code sent successfully');
        if (password == null || confirmPassword == null) {
          // Get.to(() => const CreateNewPasswordScreen());
          // Get.to(() => OtpScreen(
          //       email: email,
          //       phone: phone,
          //     ));
        } else {
          // Get.to(() => OtpScreen(
          //       email: email,
          //       phone: phone,
          //       password: password,
          //       confirmPassword: confirmPassword,
          //     ));
        }
        return true;
      } else {
        Navigator.of(Get.overlayContext!).pop();
        AbySnackBar.errorSnackbar(
            text:
                'There was a problem with the server\nOTP Code could not be sent. Please try again later.');
        return false;
      }
    } catch (e) {
      Navigator.of(Get.overlayContext!).pop();
      AbySnackBar.errorSnackbar(text: 'Error occured, please try again');
      return false;
    }
  }

  Future<bool> passwordReset({
    required String password,
    required String confirmPassword,
    required String phone,
    required String otpCode,
  }) async {
    loading(true);
    try {
      final response = await http.post(
        Uri.parse(
            '$protocol$baseUrl/auth/paassword-reset?password_confirmation=$confirmPassword&password=$password&phone_number=$phone&otp=$otpCode'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        AbySnackBar.successSnackbar(text: 'Password reset successful!');
        loading(false);
        return true;
      } else {
        AbySnackBar.errorSnackbar(
            text: 'Password reset failed, please try again');
        loading(false);
        return false;
      }
    } catch (e) {
      AbySnackBar.errorSnackbar(text: 'Error occured, please try again');
      loading(false);
      return false;
    }
  }

  Future<bool> signup({
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String otp,
  }) async {
    loading(false);
    try {
      final response = await http.post(
        Uri.parse(
            '$protocol$baseUrl/auth/register?email=$email&phone_number=$phone&password=$password&otp=$otp'),
        // body: {
        //   'email': email,
        //   'phone_number': phone,
        //   'password': password,
        //   'otp': otp,
        // },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      var responseBody = jsonDecode(response.body);
      // print(response.body);
      if (response.statusCode == 201) {
        if (responseBody['error'] == false) {
          AbySnackBar.warningSnackbar(text: responseBody['message']);
        } else {
          Get.dialog(
            const StatusDialog(),
            barrierDismissible: false,
          );
          Future.delayed(
            const Duration(seconds: 6),
            () {
              Get.offAllNamed('login');
            },
          );
          AbySnackBar.successSnackbar(text: 'Welcome to FyndRx');
        }
        return true;
      } else if (response.statusCode == 422) {
        // If signup request is successful but throws an error from db
        if (responseBody['status'] != null) {
          AbySnackBar.warningSnackbar(text: responseBody['message']);
        } else {
          // If the provided email already exist
          if (responseBody['errors']['email'] != null) {
            AbySnackBar.warningSnackbar(
                text: responseBody['errors']['email'][0]);
            // If the provided phone number already exist
          } else if (responseBody['errors']['phone_number'] != null) {
            AbySnackBar.warningSnackbar(
                text: responseBody['errors']['phone_number'][0]);
            // If the provided username already exist
          } else if (responseBody['errors']['username'] != null) {
            AbySnackBar.warningSnackbar(
                text: responseBody['errors']['username'][0]);

            // If the request is successful but not any of the above
          } else {
            AbySnackBar.warningSnackbar(text: responseBody['message']);
          }
        }
        loading(false);
        return false;
      } else if (response.statusCode == 401) {
        AbySnackBar.warningSnackbar(text: responseBody['message']);
        return false;
      } else {
        loading(false);
        // If server throws an error
        AbySnackBar.errorSnackbar(text: 'Error occured while processing data');
        return false;
      }
    } catch (e) {
      AbySnackBar.errorSnackbar(text: 'Error occured, please try again');
      loading(false);
      return false;
    }
  }

  Future<bool> profilePicture({
    required String image,
  }) async {
    try {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const LoadingDialog();
        },
      );

      var token = localStorage.read('token')!;
      var request = http.MultipartRequest(
          'POST', Uri.parse("$protocol$baseUrl/user/picture/upload"))
        ..files.add(await http.MultipartFile.fromPath('profile_picture', image))
        ..headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
      var response = await request.send();
      // print(response.reasonPhrase);
      // print(response.statusCode);
      // final x = await response.stream.bytesToString();
      // print(x);
      if (response.statusCode == 200) {
        Navigator.pop(Get.overlayContext!);
        AbySnackBar.successSnackbar(
            text: 'Profile picture Added successfully!');
        return true;
      } else {
        Navigator.pop(Get.overlayContext!);
        AbySnackBar.errorSnackbar(
            text: 'Your profile picture couldn\'t be added.');
        return false;
      }
    } catch (e) {
      // print(e);
      Navigator.pop(Get.overlayContext!);
      AbySnackBar.errorSnackbar(text: 'Error occured, please try again later.');
      return false;
    }
  }

  Future<bool> updateProfile({
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const LoadingDialog();
        },
      );

      var token = localStorage.read('token');
      final response = await http.post(
        Uri.parse('$protocol$baseUrl/user/details/update'),
        body: jsonEncode({
          'firstname': firstName,
          'lastname': lastName,
          'dob': dateOfBirth,
          'email': email,
          'phone_number': phoneNumber,
        }),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        Navigator.pop(Get.overlayContext!);
        AbySnackBar.successSnackbar(
            text: 'Your profile has been updated succesfully!');
        return true;
      } else {
        Navigator.pop(Get.overlayContext!);
        AbySnackBar.errorSnackbar(
            text: 'Profile update failed, please try again later.');
        return false;
      }
    } catch (e) {
      Navigator.pop(Get.overlayContext!);
      return false;
    }
  }

  // get auth user
  Future<AuthData> authUser() async {
    try {
      var token = localStorage.read('token')!;
      var response = await http.get(
        Uri.parse("$protocol$baseUrl/user/details/get"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // print('Get auth user: ${response.body}');
      // print(token);
      if (response.statusCode == 200) {
        return AuthData(user: userModelFromJson(response.body), other: null);
      } else if (response.statusCode == 401) {
        // box.remove('token');
        localStorage.remove('token');
        final data = jsonDecode(response.body);
        return AuthData(user: null, other: data);
      } else {
        return AuthData(other: null, user: null);
      }
    } catch (e) {
      // print(e);
      return AuthData(other: null, user: null);
    }
  }

  Future<bool> logout() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    var token = localStorage.read('token');
    final response = await http.post(
      Uri.parse('$protocol$baseUrl/auth/logout'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      // box.remove('token');
      localStorage.remove('token');
      // Get.offAll(() => const LoginScreen());
      AbySnackBar.successSnackbar(
          text: 'You have been successfully logged out!');
      return true;
    } else if (response.statusCode == 401) {
      // box.remove('token');
      localStorage.remove('token');
      // Get.offAll(() => const LoginScreen());
      AbySnackBar.successSnackbar(
          text: 'You have been successfully logged out!');
      return true;
    } else {
      Navigator.pop(Get.overlayContext!);
      AbySnackBar.errorSnackbar(
          text: 'Request failed with status: ${response.statusCode}.');
      return false;
    }
  }
}
