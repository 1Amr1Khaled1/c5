import 'package:c2/constants/app_imports.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController navBarController = Get.find();
    return Obx(
      () {
        return navBarController.cartPlantList.isEmpty
            ? Center(
                child: Text(
                  AppStrings.noItemsInYourCartText,
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
                itemCount: navBarController.cartPlantList.length,
                itemBuilder: (BuildContext context, int index) {
                  PlantModel plant = navBarController.cartPlantList[index];
                  return InkWell(
                    onTap: () => Get.toNamed(
                      AppStrings.detailsRoute,
                      arguments: plant,
                    ),
                    child: CartAndFavoritePlantWidget(
                      plant,
                      cartWidgets: Row(
                        children: [
                          InkWell(
                            onTap: () => navBarController.checkAndAddToCartPlantListOrDeleteFromCartPlantList(plant),
                            child: Icon(
                              Icons.delete_outline,
                              color: AppColors.greenColor,
                              size: 24,
                            ),
                          ),
                          const GapWidget(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () => navBarController.onMinusOneFromTheCountOfThePlantItem(plant),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppStrings.minusSign,
                                    style: AppFonts.font20Black.copyWith(
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () {
                                  return Text(
                                    plant.count.value.toString(),
                                    style: AppFonts.font20Black.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  );
                                },
                              ),
                              InkWell(
                                onTap: () => navBarController.onPlusOneToTheCountOfThePlantItem(plant),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppStrings.plusSign,
                                    style: AppFonts.font20Black.copyWith(
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
