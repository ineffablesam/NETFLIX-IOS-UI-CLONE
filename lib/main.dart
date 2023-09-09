import 'package:flutter/material.dart' hide Card;
import 'package:motion/motion.dart';

import 'Core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();
  runApp(const AppWidget());
}
