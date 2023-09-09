import 'package:bccm_player/bccm_player.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:motion/motion.dart';

import 'Core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();
  await BccmPlayerInterface.instance.setup();
  runApp(const AppWidget());
}
