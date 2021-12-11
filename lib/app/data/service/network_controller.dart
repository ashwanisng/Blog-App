// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var isInternetConnected = false.obs;

  final connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> subscription;

  // Connection Type

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await connectivity.checkConnectivity();
    } catch (e) {
      print(e);
    }
    return getConnectionStatus(connectivityResult);
  }

  // Connection Status

  getConnectionStatus(ConnectivityResult connectivityResult) async {
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      isInternetConnected.value = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isInternetConnected.value = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      isInternetConnected.value = false;
    }
  }

  @override
  void onInit() {
    getConnectionType();
    subscription =
        connectivity.onConnectivityChanged.listen(getConnectionStatus);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
