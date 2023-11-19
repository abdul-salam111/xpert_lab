import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../appConst/index.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SplashScreenController();

  @override
  void onReady() async {
    final SharedPreferences prefs = await _prefs;
    var welcomeScreenSeen = prefs.get("welcomeScreenDone");
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      if (welcomeScreenSeen == true && currentUser != null) {
        Get.offAllNamed(Routes.NAV_BAR);
        
      } else if (welcomeScreenSeen == true) {
        Get.offAllNamed(Routes.SIGN_IN);
      } else {
        Get.offAllNamed(Routes.WELCOME_SCREEN);
      }
    });
  }
}
