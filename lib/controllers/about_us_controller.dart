import 'package:fastkart_user/config.dart';
import 'package:get_storage/get_storage.dart';

class AboutUsController extends GetxController{
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final getStorage = GetStorage();

  //go to home
  goToHome()async{
    Get.back();
    await getStorage.write('selectedIndex', 0);
    appCtrl.selectedIndex = 0;
    update();
  }
}