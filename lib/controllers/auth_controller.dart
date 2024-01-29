import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../services/auth_services.dart';
import '../widgets/aby_snackbar.dart';

class AuthController extends GetxController {
  final AuthServices authServices = AuthServices();
  var loading = false.obs;
// prescription image
  var image = Rxn<File?>().obs;
  String? imagePath;
  var isFilePicked = false.obs;
  Future<bool> pickProfilePicture() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        File file = File(result.files.single.path!);
        image.value.value = file;
        imagePath = file.path;
        isFilePicked(true);
        profilePicture(picPath: file.path);
        // AbySnackBar.successSnackbar(text: 'Image selected successfully!');
        return true;
      } else {
        isFilePicked(false);
        // User canceled the picker
        // AbySnackBar.errorSnackbar(text: 'You haven\'t picked any pictures');
        return false;
      }
    } catch (e) {
      isFilePicked(false);
      // file picker fail
      AbySnackBar.errorSnackbar(text: '$e');
      return false;
    }
  }

  Future<bool> profilePicture({required String picPath}) async {
    final response = await authServices.profilePicture(image: picPath);
    return response;
  }

  Future<bool> updateProfile({
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String email,
    required String phoneNumber,
  }) async {
    final result = await authServices.updateProfile(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      email: email,
      phoneNumber: phoneNumber,
    );

    if (result == true) {
      // Get.to(() => const ProfileScreen());
      return true;
    } else {
      return false;
    }
  }

  var user = Rxn<UserModel>().obs;
  Future<AuthData> getAuthUser() async {
    try {
      loading(true);
      final response = await authServices.authUser();
      if (response.user != null) {
        user.value(response.user);
        // print(response.user);
        // print('Response from controller: ${response.user.profilePicture!}');
        return AuthData(other: null, user: response.user);
      } else if (response.other != null) {
        return AuthData(other: response.other, user: null);
      } else {
        loading(false);
        return AuthData(other: null, user: null);
      }
    } finally {
      loading(false);
    }
  }

  @override
  void onInit() {
    getAuthUser();
    super.onInit();
  }
}
