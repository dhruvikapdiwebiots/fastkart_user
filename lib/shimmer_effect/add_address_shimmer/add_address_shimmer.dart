import 'package:fastkart_user/shimmer_effect/add_address_shimmer/data_list_shimmer.dart';

import '../../config.dart';

class AddAddressPageShimmer extends StatelessWidget {
  const AddAddressPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Scaffold(

        body: Shimmer.fromColors(
            baseColor: appCtrl.appTheme.darkGray.withOpacity(.3),
            highlightColor: appCtrl.appTheme.darkGray.withOpacity(.1),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Stack(
                      children: [
                        CommonShimmerWidget().commonShimmer(
                            color: appCtrl.appTheme.lightGray.withOpacity(.5),
                            borderColor: appCtrl.appTheme.lightGray.withOpacity(.5),
                            borderRadius: 0,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height),
                        const DeliveryTimeShimmer(),
                        const PositionedShimmer(),
                      ],
                    ),
                    const DataShimmer()
                  ],
                ),
                CommonShimmerStyle().commonButton(context: context,color: appCtrl.appTheme.lightGray.withOpacity(.5),textColor: appCtrl.appTheme.darkGray)
              ],
            )),
      );
    });
  }
}
