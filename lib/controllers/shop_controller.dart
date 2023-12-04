import 'package:fastkart_user/config.dart';

class ShopController extends GetxController {
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int selectIndex = 0;
  bool isLoading = true;
  List offerList = [];
  List shopCategoryList = [];
  String dropDownVal = "Fresh Fruits& Vegetables";
  int packSizeIndex = 0;
  RangeValues currentRangeValues = const RangeValues(0, 100);

  //quantity increment function
  plusTap(index) {
    int count = int.parse(offerList[index]['quantity'].toString());
    count = count + 1;
    offerList[index]['quantity'] = count.toString();
    update();
  }

  //action button tap
  actionButtonTap() async {
    await appCtrl.getStorage.write('selectedIndex', appCtrl.selectedIndex);
    appCtrl.selectedIndex = 3;
    appCtrl.update();
  }

  //quantity decrement function
  minusTap(index) {
    if (offerList[index]['quantity'] != 0) {
      if (offerList[index]['quantity'] == "0") {
        offerList[index]['quantity'] = "0";
        update();
      } else {
        int count = int.parse(offerList[index]['quantity'].toString());
        count = count - 1;
        offerList[index]['quantity'] = count.toString();
        update();
      }
    }
  }

  //get shop data
  getData() async {
    offerList = AppArray().shopList;
    shopCategoryList = AppArray().shopCategoryList;
    update();
    await Future.delayed(Durations.s2);
    isLoading = false;
    update();
    // selectCategory(1);
  }

  //select category function
  selectCategory(index, id) {
    selectIndex = index;
    update();
  }

  //filter bottom sheet
  bottomSheet({data,}) {
    BottomSheetLayout().bottomSheet(
        child: GetBuilder<ShopController>(builder: (_) {
          return ShopFilterSheet(
              packageSize: const PackageSizeSelection(),
              rangeSlider: const PriceRangeSelection(),
              buttonLayout: CommonCancelCloseApplyButton(
                button1: ShopFont().close,
                button2: ShopFont().cancel,
              ),
              child: const CategorySelectionLayout());
        }));
  }


  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    super.onReady();
  }
}
