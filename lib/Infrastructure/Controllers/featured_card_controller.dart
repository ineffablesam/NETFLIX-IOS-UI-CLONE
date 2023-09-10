import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';

class FeaturedCardController extends GetxController {
  final Rx<Color> backgroundColor = Rx<Color>(Color(0xe5c41313));

  void generateRandomColor() {
    final random = Random();
    const maxColorValue = 128;
    final randomColor = Color.fromARGB(
      255,
      random.nextInt(maxColorValue),
      random.nextInt(maxColorValue),
      random.nextInt(maxColorValue),
    );

    backgroundColor.value = randomColor;
  }
}
