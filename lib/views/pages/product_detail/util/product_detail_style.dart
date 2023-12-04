import 'package:fastkart_user/config.dart';

class ProductDetailStyle {
  //detail layout
  Widget detailLayout({Widget? child, var whiteColor}) {
    return Container(
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(10)),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(20)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(20)))),
      child: child,
    );
  }

  //product name layout
  Widget productNameTextLayout() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
      child: ProductDetailFontStyle().mulishtextLayout(
          text: '${'Assorted Capsicum Combo'.tr} - ${'colorName'.tr}',
          fontSize: ProductDetailFontSize.textSizeSMedium,
          fontWeight: FontWeight.w800,
          overflow: TextOverflow.clip),
    );
  }

  //rating value
  Widget ratingValueLayout(darkContentColor) {
    return ProductDetailFontStyle().mulishtextLayout(
        text: '(150 ${ProductDetailFont().ratings})',
        fontSize: ProductDetailFontSize.textSizeSmall,
        color: darkContentColor,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.clip);
  }

  //check icon Layout
  Widget checkIcon({var iconColor, var containerColor}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(3),
          vertical: AppScreenUtil().screenHeight(2)),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(2)),
              bottomLeft: Radius.circular(AppScreenUtil().borderRadius(2)))),
      child: Icon(
        Icons.check,
        size: AppScreenUtil().size(16),
        color: iconColor,
      ),
    );
  }

}
