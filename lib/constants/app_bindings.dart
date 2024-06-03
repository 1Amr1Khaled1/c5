import 'package:c2/constants/app_imports.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => NavBarController(),
      fenix: true,
    );
  }
}
