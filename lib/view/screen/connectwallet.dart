import 'package:bidding/controller/connectwallet_controller.dart';
import 'package:bidding/core/constant/images.dart';
import 'package:bidding/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectWallet extends StatelessWidget {
  const ConnectWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConnectWalletControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child:
                GetBuilder<ConnectWalletControllerImp>(builder: (controller) {
              if (controller.isConnected && controller.isInOperatingChain) {
                controller.goHome();
              } else if (controller.isConnected &&
                  !controller.isInOperatingChain) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "Wrong chain. Please connect to ${ConnectWalletControllerImp.operatingChain}"),
                    const SizedBox(height: 8),
                    Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          textColor: Colors.white,
                          onPressed: () {
                            // controller.gohome();
                            final ConnectWalletControllerImp
                                metaMaskController = Get.find();

                            metaMaskController.connect();
                          },
                          // color: AppColor.primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                child: Image.asset(AppImageAsset.metamask),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Connect Metamask",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    )
                  ],
                );
              } else if (controller.isEnabled) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Click the button..."),
                    const SizedBox(height: 8),
                    Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          textColor: Colors.white,
                          onPressed: () {
                            // controller.gohome();
                            final ConnectWalletControllerImp
                                metaMaskController = Get.find();
                            metaMaskController.connect();
                          },
                          // color: AppColor.primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                child: Image.asset(AppImageAsset.metamask),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Connect Metamask",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    )
                  ],
                );
              } else {
                return Text("Please use a Web3 supported browser.");
              }
            }),
          ),
        ],
      ),
    );
  }
}
