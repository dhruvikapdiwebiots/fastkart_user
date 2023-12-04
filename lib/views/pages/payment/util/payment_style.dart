import '../../../../config.dart';

class PaymentStyle{

  //price detail layout
  Widget priceDetailLayout({var boxColor, Widget? child}) {
    return Container(
        height: AppScreenUtil().screenHeight(
            AppScreenUtil().screenActualWidth() > 370 ? 200 : 220),
        margin: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(15),
            left: AppScreenUtil().screenWidth(15),
            right: AppScreenUtil().screenWidth(15),
            bottom: AppScreenUtil().screenHeight(20)),
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(15),
            horizontal: AppScreenUtil().screenWidth(15)),
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius:
            BorderRadius.circular(AppScreenUtil().borderRadius(10))),
        child: child);
  }

  //add card Layout
  Widget addCardLayout({Widget? child,context}){
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
              topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
        ),
        height: MediaQuery.of(context).size.height /
            AppScreenUtil().screenHeight(2),
        child: child);
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
              topRight: Radius.circular(AppScreenUtil().borderRadius(5)),
              bottomLeft: Radius.circular(AppScreenUtil().borderRadius(5)))),
      child: Icon(
        Icons.check,
        size: AppScreenUtil().size(16),
        color: iconColor,
      ),
    );
  }

  //appbar title layout
  Widget appBarTitleLayout({String? text, var textColor}) {
    return PaymentFontStyle().mulishtextLayout(
        text: text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: textColor);
  }

}