import 'package:fastkart_user/config.dart';


//Widget Layout
class MyCartWidget {
  //appbar leading layout
  Widget appBarLeadingLayput({Widget? child, var textColor}) {
    return Container(
      height: AppScreenUtil()
          .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 21 : 27),
      width: AppScreenUtil()
          .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 21 : 27),
      margin: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(15),
          right: AppScreenUtil().screenWidth(8)),
      decoration: BoxDecoration(
          border: Border.all(color: textColor, width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }

  //appbar action layout
  Widget appBarActionLayout({GestureTapCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: AppScreenUtil()
              .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 6 : 0),
          top: AppScreenUtil()
              .screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 8 : 2),
          right: AppScreenUtil().screenWidth(15)),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconAssets.drawerHome,
          height: AppScreenUtil().screenHeight(20),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  //common text layout
  Widget commonTextLayout({String? text, var color, var fontWeight}) {
    return MyCartFontStyle().mulishtextLayout(
        text: text,
        color: color,
        fontSize: MyCartFontSize.textSizeSmall,
        fontWeight: fontWeight);
  }

  //common price detail layout
  Widget commonPriceDetail(
      {String? title,
      String? val,
      var titleColor,
      var valColor,
      var fontWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyCartWidget().commonTextLayout(
            text: title, color: titleColor, fontWeight: fontWeight),
        MyCartWidget().commonTextLayout(
            text: val, color: valColor, fontWeight: fontWeight),
      ],
    );
  }

  //appbar
  PreferredSizeWidget appBarLayout(
      {GestureTapCallback? onTap, GestureTapCallback? actionOnTap}) {
    return AppBarLayoutCustom(
      onTap: onTap,
      actionOnTap: actionOnTap,
    );
  }

  //common text
  Widget commonText({String? text, var titleColor}){
    return MyCartFontStyle().mulishtextLayout(
        text: text, fontSize: 13, color: titleColor);
  }

  //discount layout
  Widget discountLayout({discountBoxColor, Widget? child}){
    return Container(
      decoration: BoxDecoration(
          color: discountBoxColor,
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(
          left: AppScreenUtil().screenHeight(5)),
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(10),
          vertical: AppScreenUtil().screenHeight(3)),
      child: child,
    );
  }
}
