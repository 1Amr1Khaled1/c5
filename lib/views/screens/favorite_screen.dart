import 'package:c2/constants/app_imports.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController navBarController = Get.find();
    return Obx(
      () {
        return navBarController.favPlantList.isEmpty
            ? Center(
                child: Text(
                  AppStrings.noFavoriteItemsYetText,
                  style: AppFonts.font20Black.copyWith(
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  bottom: 45,
                  left: 10,
                ),
                itemCount: navBarController.favPlantList.length,
                itemBuilder: (BuildContext context, int index) {
                  PlantModel plant = navBarController.favPlantList[index];
                  return InkWell(
                    onTap: () => Get.toNamed(
                      AppStrings.detailsRoute,
                      arguments: plant,
                    ),
                    child: CartAndFavoritePlantWidget(plant),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const GapWidget(15);
                },
              );
      },
    );
  }
}
