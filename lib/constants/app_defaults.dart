import 'package:c2/constants/app_imports.dart';

class AppDefaults {
  static OutlineInputBorder defaultInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: AppColors.transparentColor,
      ),
    );
  }

  static Future<bool?> defaultToast(String text) {
    return Fluttertoast.showToast(
      msg: text,
      backgroundColor: AppColors.blackColor,
      textColor: AppColors.whiteColor,
      fontSize: 14,
    );
  }
}
