import 'package:bidding/core/constant/routes.dart';
import 'package:bidding/view/screen/connectwallet.dart';
import 'package:bidding/view/screen/homescreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const ConnectWallet()),

  // ===================  Home  ===================
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
];
