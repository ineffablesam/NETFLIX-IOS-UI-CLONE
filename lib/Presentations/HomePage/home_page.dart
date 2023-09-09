import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:motion/motion.dart';

import '../../Common/utils/custom_tap.dart';
import '../FeaturedOverview/featured_overview.dart';
import 'Components/build_sections.dart';
import 'Components/frosted_appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF000000),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Stack(
          children: [
            FrostedAppBar(
              blurStrengthX: 8,
              blurStrengthY: 8,
              title: const Text(
                'For Samuel Philip',
                style: TextStyle(
                    fontFamily: "helvetica", fontSize: 20, color: Colors.white),
              ),
              height: 130,
              actions: const [
                Icon(
                  Icons.search,
                  color: Colors.white,
                )
              ],
              color: Colors.black.withOpacity(0.1),
              leading: const Text(""),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              clipBehavior: Clip.hardEdge,
                              closedBuilder: (BuildContext context,
                                  VoidCallback openContainer) {
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
                                            border: Border.all(
                                                color: Colors.white38,
                                                width: 0.3),
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/images/power.jpeg")),
                                            color: const Color(0xff2f2c30),
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 30,
                                          right: 10,
                                          left: 10,
                                          child: Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 42,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xEA101010),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
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
                              openBuilder: (BuildContext context,
                                  VoidCallback closeContainer) {
                                return const FeaturedOverview();
                              },
                              routeSettings: const RouteSettings(
                                name: "/featured_overview",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const buildSectionTitle(
                        title: "Continue Watching for Samuel Philip",
                      ),
                      const BuildHorizontalSlider(),
                      const BuildHorizontalSlider(),
                      const BuildHorizontalSlider(),

                      // Footer Padding
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> showPermissionRequestDialog(BuildContext context,
      {required Function() onDone}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Permission required'),
              content: const Text(
                  'On iOS 13+, you need to grant access to the gyroscope. A permission will be requested to proceed.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Motion.instance.requestPermission();
                  },
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
