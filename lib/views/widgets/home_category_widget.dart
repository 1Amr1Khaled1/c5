import 'package:c2/constants/app_imports.dart';

class HomeCategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const HomeCategoryWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: category.isSelected ? AppColors.greenColor : AppColors.secLightGreenColor,
        ),
        color: category.isSelected ? AppColors.greenColor : AppColors.whiteColor,
      ),
      child: Text(
        category.title,
        style: AppFonts.font20Black.copyWith(
          color: category.isSelected ? AppColors.whiteColor : AppColors.secLightGreenColor,
          fontSize: 16,
          fontWeight: category.isSelected ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
