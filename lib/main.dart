import 'package:c2/constants/app_imports.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightGreenColor,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        highlightColor: AppColors.transparentColor,
        splashColor: AppColors.transparentColor,
      ),
      initialBinding: AppBindings(),
      getPages: AppPages.appPages,
      initialRoute: AppStrings.navBarRoute,
    );
  }
}
