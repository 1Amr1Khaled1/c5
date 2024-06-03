import 'package:c2/constants/app_imports.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlantModel plantFromArguments = Get.arguments;
    NavBarController navBarController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.lightGreenColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar.large(
              backgroundColor: AppColors.transparentColor,
              floating: false,
              pinned: false,
              elevation: 0,
              expandedHeight: 400,
              leading: Container(),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: Hero(
                        tag: plantFromArguments.image,
                        child: Image.asset(
                          plantFromArguments.image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: Get.back,
                            child: const CircleAvatar(
                              backgroundColor: AppColors.secLightGreenColor,
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.whiteColor,
                                size: 20,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => navBarController.checkAndAddToFavPlantListOrDeleteFromFavPlantList(plantFromArguments),
                            child: CircleAvatar(
                              backgroundColor: AppColors.secLightGreenColor,
                              child: Obx(
                                () {
                                  return Icon(
                                    Icons.favorite,
                                    color: plantFromArguments.isFav.value ? AppColors.redColor : AppColors.whiteColor,
                                    size: 20,
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
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 290,
                padding: const EdgeInsets.only(
                  right: 20,
                  bottom: 10,
                  left: 20,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plantFromArguments.title,
                                style: AppFonts.font20Black.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(
                                () {
                                  return Text(
                                    AppStrings.dollarSign + AppStrings.spaceSign + (plantFromArguments.count.value * plantFromArguments.price).toString(),
                                    style: AppFonts.font20Black.copyWith(
                                      color: AppColors.greenColor,
                                      fontSize: 24,
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
                                    plantFromArguments.star.toString(),
                                    style: AppFonts.font20Black.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.lightGreenColor,
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () => navBarController.onMinusOneFromTheCountOfThePlantItem(plantFromArguments),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.secLightGreenColor,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text(
                                      AppStrings.minusSign,
                                      style: AppFonts.font20Black.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ),
                                const GapWidget(10),
                                Obx(
                                  () {
                                    return Text(
                                      plantFromArguments.count.value.toString(),
                                      style: AppFonts.font20Black.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    );
                                  },
                                ),
                                const GapWidget(10),
                                InkWell(
                                  onTap: () => navBarController.onPlusOneToTheCountOfThePlantItem(plantFromArguments),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.secLightGreenColor,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Text(
                                      AppStrings.plusSign,
                                      style: AppFonts.font20Black.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const GapWidget(15),
                      Text(
                        AppStrings.aboutPlantText,
                        style: AppFonts.font20Black.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const GapWidget(5),
                      Text(
                        AppStrings.plantDetailsText,
                        style: AppFonts.font20Black.copyWith(
                          color: AppColors.secLightGreenColor,
                          fontSize: 18,
                        ),
                      ),
                      const GapWidget(5),
                      Center(
                        child: InkWell(
                          onTap: () => navBarController.checkAndAddToCartPlantListOrDeleteFromCartPlantList(plantFromArguments),
                          child: Container(
                            height: 50,
                            width: 300,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Obx(
                              () {
                                return Text(
                                  plantFromArguments.inCart.value ? AppStrings.removeFromCartText : AppStrings.addToCartText,
                                  style: AppFonts.font20Black.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const GapWidget(25),
                    ],
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
