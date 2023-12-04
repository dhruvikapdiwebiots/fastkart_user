import '../../../../config.dart';

class ProductDetailMainLayout extends StatelessWidget {
  const ProductDetailMainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productDetailCtrl) {
      return SingleChildScrollView(
        child: Column(
          children: [
            //banner layout
            const BannerLayout(),
            ProductDetailStyle().detailLayout(
                whiteColor: productDetailCtrl.appCtrl.appTheme.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //product name layout
                    ProductDetailStyle().productNameTextLayout(),

                    //rating layout
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                      child: Row(
                        children: [
                          CommonRatingLayout(
                              value: productDetailCtrl.rating,
                              onRatingUpdate: (rating) {}),
                          const Space(5, 0),
                          ProductDetailStyle().ratingValueLayout(
                              productDetailCtrl
                                  .appCtrl.appTheme.darkContentColor),
                        ],
                      ),
                    ),
                    //price layout
                     ProductPriceLayout(
                      discountPrice: productDetailCtrl
                          .appCtrl.commonController.priceSymbol +
                          (double.parse((productDetailCtrl
                              .appCtrl.commonController.rateValue * 25.00)
                              .toStringAsFixed(2)))
                              .toString(),
                      totalPrice:  productDetailCtrl
                          .appCtrl.commonController.priceSymbol +
                          (double.parse((productDetailCtrl
                              .appCtrl.commonController.rateValue * 45.00)
                              .toStringAsFixed(2)))
                              .toString(),
                      discountText: ('25% ${'off'.tr}'),
                    ),

                    const Space(0, 15),
                    // select quantity and delivery time
                    const QuantityDeliverTimeLayout(),
                    const Space(0, 15),

                    //detail layout
                    const CommonProductDetailLayout(),

                    const Space(0, 15),
                    //product review count and see All text
                    ProductReviewAndSeeAll(
                        text: '${ProductDetailFont().productReview}(15)',
                        onTap: () => productDetailCtrl.commonBottomSheet(index: 2),
                        seeAll: ProductDetailFont().seeAll),

                    const Space(0, 20),
                    //reviewList layout
                    const ProductReview(),
                    const Space(0, 20),

                    //lowest price
                    ProductDetailWidget().lowestPrice(
                      isBigScreen: true,
                      containerColor:
                          productDetailCtrl.appCtrl.appTheme.lowestBgColor,
                      context: context,
                      child: CommonHorizontalList(
                        text: ProductDetailFont().lowestPrice,
                        title: ProductDetailFont().payLessGetMore,
                        data: AppArray().lowerPriceList,
                      ),
                    ),
                    const Space(0, 50),
                  ],
                ))
          ],
        ),
      );
    });
  }
}
