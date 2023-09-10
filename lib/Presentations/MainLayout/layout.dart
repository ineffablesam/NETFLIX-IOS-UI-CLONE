import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:netflixui/Presentations/AccountPage/account_page.dart';
import 'package:netflixui/Presentations/HomePage/home_page.dart';

import '../../Common/utils/Text/helvetica.dart';
import '../../Infrastructure/Controllers/layout_controller.dart';
import '../SearchPage/search_page.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomePage(),
      SearchPage(),
      AccountPage(),
    ];

    return Obx(() => Scaffold(
          extendBody: true,
          body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 400),
              reverse: Get.find<BottomNavBarController>().currentIndex <
                  Get.find<BottomNavBarController>().previousPageIndex,
              transitionBuilder: (child, animation, secondaryAnimation) =>
                  SharedAxisTransition(
                    fillColor: Color(0xFF000000),
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                  ),
              child: _pages
                  .elementAt(Get.find<BottomNavBarController>().currentIndex)),
          bottomNavigationBar: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 30,
                    sigmaY: 30,
                    tileMode: TileMode.repeated,
                  ),
                  child: Container(
                    height: 69.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.transparent,
                        showSelectedLabels: true,
                        selectedLabelStyle: Nunito.body(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        unselectedLabelStyle: Nunito.body(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.grey,
                        selectedFontSize: 8.sp,
                        unselectedFontSize: 8.sp,
                        showUnselectedLabels: true,
                        enableFeedback: true,
                        type: BottomNavigationBarType.fixed,
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home_outlined,
                            ),
                            activeIcon: Icon(
                              Icons.home,
                            ),
                            label: 'Explore',
                            tooltip: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.search_outlined,
                            ),
                            activeIcon: Icon(
                              Icons.search,
                            ),
                            label: 'Search',
                            tooltip: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.account_circle_outlined,
                            ),
                            activeIcon: Icon(
                              Icons.account_circle,
                            ),
                            label: 'Account',
                            tooltip: '',
                          ),
                        ],
                        currentIndex:
                            Get.find<BottomNavBarController>().currentIndex,
                        onTap: (index) {
                          HapticFeedback.lightImpact();
                          Get.find<BottomNavBarController>()
                              .updatePageIndex(index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
