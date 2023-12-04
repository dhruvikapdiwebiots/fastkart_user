import 'dart:io';
import 'package:fastkart_user/config.dart';

class SignupWidget {
  //focus change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //logo
  Widget logoImage(isTheme) {
    return isTheme
        ? Image.asset(
            imageAssets.themeLogo,
            fit: BoxFit.contain,
            height: AppScreenUtil().screenHeight(20),
          )
        : Image.asset(imageAssets.smallLogoImage);
  }

  //signup background image layout
  Widget signupBackGroundImage(String image, context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }

  //White body Container Layout
  Widget bodyContainer({Widget? child, BuildContext? context, color}) {
    return Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context!).size.height /
                (Platform.isIOS ? 9.2 : 8.5)),
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(40)),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22), topRight: Radius.circular(22))),
        child: SingleChildScrollView(
            child: Stack(
          alignment: Alignment.bottomCenter,
          children: [child!],
        )));
  }

//contiune as guest
  Widget continueAsGuest({color}) {
    return Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 10.0 : 0),
        child: SignupFontStyle()
            .mulishtextLayout(
                text: SignupFont().continueAsGuest,
                color: color,
                fontSize: SignupFontSize.textSizeSMedium,
                textDecoration: TextDecoration.underline)
            .marginOnly(bottom: 10));
  }
}
