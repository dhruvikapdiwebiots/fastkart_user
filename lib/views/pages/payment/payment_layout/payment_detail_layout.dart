import '../../../../config.dart';

class PaymentDetailLayout extends StatelessWidget {
  const PaymentDetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<PaymentController>(builder: (paymentCtrl) {
        return SingleChildScrollView(
          child: Container(

            margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(50)),
            child: Column(
              children: [
                Column(
                  children: [
                    // add address button layout
                    AddAddressButton(
                        onTap: () =>
                            paymentCtrl.addCardBottomSheet()),
                    const Space(0, 20),

                    //select card Layout
                    SizedBox(
                      height: AppScreenUtil().screenHeight(paymentCtrl.expand
                          ? (AppScreenUtil().screenActualWidth() > 370
                              ? 350
                              : 400)
                          : (AppScreenUtil().screenActualWidth() > 370
                              ? 200
                              : 250)),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => paymentCtrl.expandBox(index),
                            child: ExpandableListView(
                              lightPrimary:
                                  paymentCtrl.appCtrl.appTheme.iconBgColor,
                              titleColor:
                                  paymentCtrl.appCtrl.appTheme.titleColor,
                              onPressed: () => paymentCtrl.expandBox(index),
                              index: index,
                              title: AppArray()
                                  .paymentMethodList[index]['title']
                                  .toString(),
                              isExpanded: index == paymentCtrl.tapped
                                  ? paymentCtrl.expand
                                  : false,
                              child: index == 0
                                  ? SelectCardList(
                                      data: paymentCtrl.paymentMethodList[index]
                                          ['child'],
                                    )
                                  : index == 1
                                      ? NetBakingListLayout(
                                          data: paymentCtrl
                                                  .paymentMethodList[index]
                                              ['child'],
                                        )
                                      : index == 2
                                          ? CreditDebitLayout(
                                              data: paymentCtrl
                                                      .paymentMethodList[index]
                                                  ['child'],
                                            )
                                          : const CashOnDeliveryLayout(),
                            ),
                          );
                        },
                        itemCount: paymentCtrl.paymentMethodList.length,
                      ),
                    ),
                  ],
                ),
                //price detail
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
                  child: const PriceDetailColorLayout(),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
