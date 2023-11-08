import 'package:bidding/core/constant/routes.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

abstract class ConnectWalletController extends GetxController {}

class ConnectWalletControllerImp extends ConnectWalletController {
  static const operatingChain = 11155111;

  String currentAddress = '';

  int currentChain = -1;

  bool get isEnabled => ethereum != null;

  bool get isInOperatingChain => currentChain == operatingChain;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  Future<void> connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;

      currentChain = await ethereum!.getChainId();

      update();
    }
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
    update();
  }

  init() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) {
        clear();
      });
      ethereum!.onChainChanged((accounts) {
        clear();
      });
    }
  }

  goHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
