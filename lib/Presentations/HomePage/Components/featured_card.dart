import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:motion/motion.dart';

import '../../../Common/utils/custom_tap.dart';
import '../../FeaturedOverview/featured_overview.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color(0xe5c41313),
            // Colors.orange.withOpacity(0.5),
            Colors.transparent,
          ],
          stops: [0, 0.99],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 160,
          ),
          OpenContainer(
            closedElevation: 0,
            middleColor: const Color(0xFF000000),
            closedColor: const Color(0xFF000000),
            openColor: const Color(0xFF000000),
            transitionType: ContainerTransitionType.fade,
            closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(13))),
            clipBehavior: Clip.hardEdge,
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return CustomTap(
                end: 0.99,
                child: Motion.elevated(
                  glare: true,
                  elevation: 70,
                  borderRadius: BorderRadius.circular(13),
                  child: Stack(
                    children: [
                      Container(
                        width: 330,
                        height: 470,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white38, width: 0.3),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/power.jpeg")),
                          color: const Color(0xff2f2c30),
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 10,
                        left: 10,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'Play',
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 5),
                              decoration: BoxDecoration(
                                  color: const Color(0xEA101010),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'My List',
                                    style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            openBuilder: (BuildContext context, VoidCallback closeContainer) {
              return const FeaturedOverview();
            },
          ),
        ],
      ),
    );
  }
}
