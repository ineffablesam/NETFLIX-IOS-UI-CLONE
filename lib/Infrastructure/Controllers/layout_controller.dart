import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt _pageIndex = 0.obs;
  RxInt _previousPageIndex = 0.obs;

  int get currentIndex => _pageIndex.value;
  int get previousPageIndex => _previousPageIndex.value;

  void updatePageIndex(int newIndex) {
    _previousPageIndex.value = _pageIndex.value;
    _pageIndex.value = newIndex;
    update();
  }
}
