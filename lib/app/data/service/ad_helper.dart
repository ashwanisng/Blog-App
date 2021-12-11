import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4755319486742750/9009412783";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4755319486742750/8215205862";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
