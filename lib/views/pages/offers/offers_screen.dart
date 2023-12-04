import 'package:fastkart_user/shimmer_effect/offer_shimmer/offer_shimmer.dart';

import '../../../config.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  var offerCtrl = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (ctrl) {
      return GetBuilder<OfferController>(builder: (_) {
        return Directionality(
          textDirection:
              offerCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: offerCtrl.appCtrl.appTheme.blackColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return false;
              },
              child: offerCtrl.appCtrl.isShimmer
                  ? const OfferPageShimmer()
                  : SingleChildScrollView(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //search product textformfield layout
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AppScreenUtil().screenHeight(
                                          offerCtrl.appCtrl.languageVal ==
                                                      "ar" ||
                                                  offerCtrl.appCtrl.isRTL
                                              ? 15
                                              : 0),
                                      right: AppScreenUtil().screenHeight(
                                          offerCtrl.appCtrl.languageVal !=
                                                      "ar" ||
                                                  offerCtrl.appCtrl.isRTL
                                              ? 15
                                              : 0)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CommonSearchTextForm(
                                          text: OfferFont().searchProduct,
                                          borderColor: offerCtrl
                                              .appCtrl.appTheme.primary
                                              .withOpacity(.3),
                                          hintColor: offerCtrl
                                              .appCtrl.appTheme.contentColor,
                                          fillcolor: offerCtrl
                                              .appCtrl.appTheme.textBoxColor,
                                          titleColor: offerCtrl
                                              .appCtrl.appTheme.titleColor,
                                        ),
                                      ),
                                      OfferWidget().filterText(
                                          onTap: () =>
                                              offerCtrl.filterbottomSheet(),
                                          color: offerCtrl
                                              .appCtrl.appTheme.primary),
                                    ],
                                  ),
                                ),

                                const Space(0, 20),
                                const OfferListLayout()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        );
      });
    });
  }
}
