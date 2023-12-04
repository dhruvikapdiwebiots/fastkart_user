
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../config.dart';

class SignupController extends GetxController {
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = true;
  var appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final storage = GetStorage();
  var auth = FirebaseAuth.instance;

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //google Login function
  googleLogin() async {
    appCtrl.commonController.showLoading();
    update();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      appCtrl.commonController.hideLoading();
      update();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      (await auth.signInWithCredential(credential)).user;
      appCtrl.commonController.hideLoading();
      update();
      saveData(googleSignInAccount.id);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      showToast(e.toString());
      appCtrl.commonController.hideLoading();
      update();
    }
  }

  //save data in shared pref
  saveData(userid) async {
    await storage.write('id', userid);
    update();
    Get.toNamed(routeName.dashboard);
  }


//sign in tap function
  signInClick({context}) async {
    appCtrl.commonController.showLoading();
    update();
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await user.user!.getIdToken();
      appCtrl.commonController.hideLoading();
      update();
      email.text = "";
      password.text = "";
      FocusScope.of(context).requestFocus(FocusNode());

      Get.back();
    } catch (e) {
      appCtrl.commonController.hideLoading();
      update();
      showToast(e.toString());
    }

  }


  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }
}
