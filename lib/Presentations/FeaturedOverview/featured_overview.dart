import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflixui/Common/utils/Text/helvetica.dart';
import 'package:netflixui/Common/utils/custom_tap.dart';

class FeaturedOverview extends StatefulWidget {
  const FeaturedOverview({super.key});

  @override
  State<FeaturedOverview> createState() => _FeaturedOverviewState();
}

class _FeaturedOverviewState extends State<FeaturedOverview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF000000),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xff151515),
            expandedHeight: 300,
            collapsedHeight: 60,
            toolbarHeight: 50,
            scrolledUnderElevation: 0,
            elevation: 0,
            automaticallyImplyLeading: false,
            stretch: true,
            pinned: true,
            floating: true,
            title: const Text(
              'Power',
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 44.69662408759126,
                  ),
                ],
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/power.jpeg',
                    fit: BoxFit.cover,
                    height: 800,
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                  ),
                  Container(
                    height: 800,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFF000000),
                          Color(0xFF000000),
                        ],
                        stops: [0, 1, 0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.horizontalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "Power (2014) Movie of the Year Hit of the Year",
                    style: Nunito.body(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                7.verticalSpace,
                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "James \"Ghost\" St. Patrick, a wealthy New York night club owner who has it all, catering to the city's elite and dreaming big, lives a double life as a drug kingpin.",
                    style: Nunito.body(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTap(
                          onTap: () {},
                          end: 0.99,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                5.horizontalSpace,
                                Text(
                                  "Play",
                                  style: Nunito.body(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTap(
                          onTap: () {},
                          end: 0.99,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                5.horizontalSpace,
                                Text(
                                  "Add to My List",
                                  style: Nunito.body(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
}

//
// Column(
// children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.r),
//                               color: Colors.grey[600],
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(1.h),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.r),
//                                 child: BccmPlayerTheme(
//                                   playerTheme: BccmPlayerThemeData(
//                                     controls: BccmControlsThemeData(
//                                       primaryColor: Colors.white,
//                                       durationTextStyle:
//                                           const TextStyle(color: Colors.green),
//                                     ),
//                                   ),
//                                   child: BccmPlayerView(
//                                     controller.playerController,
//                                     config: BccmPlayerViewConfig(
//                                       allowSystemGestures: true,
//                                       useSurfaceView: true,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             controller.playNewVideo(
//                                 'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8');
//                           },
//                           child: const Text('Play New Video'),
//                         ),
//                       ],
//                     ),
