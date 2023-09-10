import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motion/motion.dart';

import '../../../Infrastructure/Controllers/featured_card_controller.dart';
import '../../FeaturedOverview/featured_overview.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final FeaturedCardController controller = Get.put(FeaturedCardController());
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 510.h,
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          FadeInDownBig(
              animate: true,
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  width: 330,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        controller.backgroundColor.value,
                        Colors.transparent,
                      ],
                      stops: [0, 0.99],
                    ),
                  ),
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              90.verticalSpace,
              OpenContainer(
                closedElevation: 0,
                middleColor: Colors.transparent,
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                clipBehavior: Clip.none,
                transitionType: ContainerTransitionType.fade,
                closedShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))),
                closedBuilder:
                    (BuildContext context, VoidCallback openContainer) {
                  return Motion.elevated(
                    glare: true,
                    elevation: 70,
                    controller: MotionController(
                      damping: 0.7,
                    ),
                    borderRadius: BorderRadius.circular(13),
                    child: Stack(
                      children: [
                        Container(
                          width: 290.w,
                          height: 390.h,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white38, width: 0.3.h),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/power.jpeg")),
                            color: const Color(0xff2f2c30),
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                openBuilder:
                    (BuildContext context, VoidCallback closeContainer) {
                  return const FeaturedOverview();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
