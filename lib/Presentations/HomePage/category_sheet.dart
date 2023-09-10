import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflixui/Common/utils/Text/helvetica.dart';
import 'package:netflixui/Common/utils/custom_tap.dart';

class CategoryPage extends StatelessWidget {
  final String imagePath;

  const CategoryPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      // Start of the optional properties
      isFullScreen: true,
      disabled: false,
      minRadius: 10,
      // maxRadius: 10,
      // dragSensitivity: 1.0,
      // // maxTransformValue: .8,
      direction: DismissiblePageDismissDirection.multi,
      backgroundColor: Colors.transparent,
      dismissThresholds: {
        DismissiblePageDismissDirection.vertical: .2,
      },
      minScale: .1,
      // startingOpacity: 1,
      // reverseDuration: const Duration(milliseconds: 250),
      // End of the optional properties
      child: Scaffold(
        floatingActionButton: CustomTap(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 24.r,
            backgroundColor: Colors.white,
            child: IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.transparent,
        body: FadeIn(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 36.7, sigmaY: 36.7),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    // physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        99.verticalSpace,
                        Text(
                          'Choose a Category',
                          style: Nunito.body(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        ...List.generate(40, (index) => index + 1).map(
                          (index) {
                            return ListTile(
                              title: Text(
                                'Category $index',
                                textAlign: TextAlign.center,
                                style: Nunito.body(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                        ),
                        99.verticalSpace,
                      ],
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        stops: [0, 0.99],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
