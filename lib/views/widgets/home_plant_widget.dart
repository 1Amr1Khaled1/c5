import 'package:c2/constants/app_imports.dart';

class HomePlantWidget extends StatelessWidget {
  final PlantModel plant;
  final NavBarController navBarController;

  const HomePlantWidget(
    this.plant, {
    required this.navBarController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 5,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGreenColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: plant.image,
                    child: Image.asset(plant.image),
                  ),
                ),
                const GapWidget(5),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    plant.title,
                    style: AppFonts.font20Black.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const GapWidget(5),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          AppStrings.dollarSign + AppStrings.spaceSign + plant.price.toString(),
                          style: AppFonts.font20Black.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.thiLightGreenColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => navBarController.checkAndAddToCartPlantListOrDeleteFromCartPlantList(plant),
                        child: CircleAvatar(
                          backgroundColor: AppColors.secLightGreenColor,
                          radius: 15,
                          child: Obx(
                            () {
                              return Icon(
                                plant.inCart.value ? Icons.delete_outline : Icons.add,
                                color: AppColors.whiteColor,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: InkWell(
                onTap: () => navBarController.checkAndAddToFavPlantListOrDeleteFromFavPlantList(plant),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.secLightGreenColor,
                  child: Obx(
                    () {
                      return Icon(
                        Icons.favorite,
                        size: 18,
                        color: plant.isFav.value ? AppColors.redColor : AppColors.whiteColor,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
