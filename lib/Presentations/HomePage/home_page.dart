import 'package:flutter/material.dart';
import 'package:motion/motion.dart';

import 'Components/build_sections.dart';
import 'Components/featured_card.dart';
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
      body: const CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FeaturedCard(),
                      buildSectionTitle(
                        title: "Continue Watching for Samuel Philip",
                      ),
                      BuildHorizontalSlider(),
                      buildSectionTitle(
                        title: "Trending Now",
                      ),
                      BuildHorizontalSlider(),
                      buildSectionTitle(
                        title: "New Releases",
                      ),
                      BuildHorizontalSlider(),

                      // Footer Padding
                      SizedBox(
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
