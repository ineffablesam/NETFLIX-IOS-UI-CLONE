import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion/motion.dart';
import 'package:netflixui/Common/utils/custom_tap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../Common/utils/Text/helvetica.dart';
import 'Components/build_sections.dart';
import 'Components/featured_card.dart';
import 'Components/frosted_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: const Color(0xFF000000),
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SlideInUp(
        child: Padding(
          padding: EdgeInsets.only(bottom: 80.h),
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTap(
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                  child: Text(
                    "TV Shows",
                    style: Nunito.body(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey.shade800,
                  thickness: 0.5,
                ),
                CustomTap(
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                  child: Text(
                    "Movies",
                    style: Nunito.body(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey.shade800,
                  thickness: 0.5,
                ),
                CustomTap(
                  onTap: () {
                    HapticFeedback.selectionClick();
                  },
                  child: Text(
                    "Categories",
                    style: Nunito.body(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Stack(
          children: [
            FrostedAppBar(
              sigmaX: 30.7,
              sigmaY: 30.7,
              title: Text(
                'For Samuel Philip',
                style: Nunito.body(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white),
              ),
              height: 85.h,
              actions: const [
                Icon(
                  Icons.search,
                  color: Colors.white,
                )
              ],
              color: Colors.transparent,
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverStack(
            children: const [
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
              ),
            ],
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
