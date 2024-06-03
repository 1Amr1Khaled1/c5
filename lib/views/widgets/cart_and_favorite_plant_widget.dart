import 'package:c2/constants/app_imports.dart';

class CartAndFavoritePlantWidget extends StatelessWidget {
  final Widget? cartWidgets;
  final PlantModel plant;

  const CartAndFavoritePlantWidget(
    this.plant, {
    this.cartWidgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavBarController navBarController = Get.find();
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGreenColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.secLightGreenColor,
            offset: Offset(0, 0),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: plant.image,
                  child: Image.asset(
                    plant.image,
                  ),
                ),
              ),
              const GapWidget(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.title,
                    style: AppFonts.font20Black.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cartWidgets == null
                      ? Text(
                          AppStrings.dollarSign + AppStrings.spaceSign + plant.price.toString(),
                          style: AppFonts.font20Black.copyWith(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Obx(
                          () {
                            return Text(
                              AppStrings.dollarSign + AppStrings.spaceSign + (plant.count.value * plant.price).toString(),
                              style: AppFonts.font20Black.copyWith(
                                color: AppColors.greenColor,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.yellowColor,
                        size: 20,
                      ),
                      const GapWidget(5),
                      Text(
                        plant.star.toString(),
                        style: AppFonts.font20Black.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          cartWidgets ??
              InkWell(
                onTap: () => navBarController.checkAndAddToFavPlantListOrDeleteFromFavPlantList(plant),
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  child: Obx(
                    () {
                      return Icon(
                        Icons.favorite,
                        size: 20,
                        color: plant.isFav.value ? AppColors.redColor : AppColors.whiteColor,
                      );
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
