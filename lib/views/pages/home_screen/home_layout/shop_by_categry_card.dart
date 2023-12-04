import '../../../../config.dart';

class ShopByCategoryData extends StatelessWidget {
  final int? index;
  const ShopByCategoryData({Key? key,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return InkWell(
            onTap: () async {
              await homeCtrl.appCtrl.getStorage
                  .write('selectedIndex', homeCtrl.appCtrl.selectedIndex);
              homeCtrl.appCtrl.selectedIndex = 1;
              homeCtrl.appCtrl.update();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: AppScreenUtil().screenHeight(50),
                      width: AppScreenUtil().screenWidth(65),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppArray().categoryData[index!].color,
                              width: 2),
                          color:
                          AppArray().categoryData[index!].containercolor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      //   margin: EdgeInsets.only(),
                      padding: EdgeInsets.only(
                          top: AppScreenUtil().screenHeight(20),
                          left: AppScreenUtil().size(0)),
                      child: Image.asset(
                        AppArray().categoryData[index!].image,
                        height: AppScreenUtil().screenHeight(45),
                        width: AppScreenUtil().screenWidth(45),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                const Space(0, 5),
                HomeFontStyle().mulishtextLayout(
                    color: homeCtrl.appCtrl.appTheme.titleColor,
                    text: AppArray().categoryData[index!].title.toString(),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    overflow: TextOverflow.clip)
              ],
            ));
      }
    );
  }
}
