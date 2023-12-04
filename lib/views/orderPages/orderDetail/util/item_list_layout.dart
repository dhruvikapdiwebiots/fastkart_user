import 'package:fastkart_user/config.dart';

class ItemListLayout extends StatelessWidget {
  const ItemListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return GetBuilder<OrderDetailController>(
          builder: (orderDetailCtrl) {
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth( 15)),
              height: AppScreenUtil().screenHeight(AppScreenUtil().screenActualWidth() > 370 ? 170 :220),
              child: ListView.builder(
                itemCount: orderDetailCtrl.orderDetailList.length,
                itemBuilder: (context, index) {
                  return ItemListCard(
                    data: orderDetailCtrl.orderDetailList[index],
                    index: index,
                    lastIndex:
                    orderDetailCtrl.orderDetailList.length - 1,
                  );
                },
              ),
            );
          }
        );
      }
    );
  }
}
