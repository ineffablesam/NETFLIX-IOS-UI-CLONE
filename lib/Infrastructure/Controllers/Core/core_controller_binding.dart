// Logic for CoreController Binding goes here

import 'package:get/get.dart';
import 'package:netflixui/Infrastructure/Controllers/custom_video_controller.dart';
import 'package:netflixui/Infrastructure/Controllers/layout_controller.dart';

import '../home_controller.dart';

class CoreControllerBinding extends Bindings {
  @override
  void dependencies() {
    // [Note]: Controller for Layout (BottomNavBar, PageTransitionSwitcher)
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());

    // [Note]: Controller for Home Page (Featured Card, Sections)
    Get.lazyPut<HomeController>(() => HomeController());
    // [Note]: Controller for Custom Video Player in Featured Card
    Get.lazyPut<CustomVideoController>(() => CustomVideoController());
  }
}
