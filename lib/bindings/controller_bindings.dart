import 'package:get/instance_manager.dart';
import 'package:rentent/controllers/auth_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    // Get.put<Controller>(Controller());
  }
}
