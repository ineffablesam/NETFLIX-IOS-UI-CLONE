import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflixui/Common/utils/Text/helvetica.dart';

import '../../../Common/utils/custom_tap.dart';

class FrostedAppBar extends StatelessWidget {
  final double height;
  final Widget title;
  final List<Widget> actions;
  final Color color;
  final double sigmaX;
  final double sigmaY;
  const FrostedAppBar({
    super.key,
    required this.height,
    required this.actions,
    required this.color,
    required this.title,
    required this.sigmaX,
    required this.sigmaY,
  });
  //
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
          tileMode: TileMode.repeated,
        ),
        child: Container(
          color: color,
          alignment: Alignment.center,
          width: double.infinity,
          height: height,
          child: Padding(
            padding: EdgeInsets.only(
              right: 20.w,
              left: 10.w,
              top: 20.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    10.horizontalSpace,
                    Expanded(
                      child: title,
                    ),
                    ...actions
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildAppBarButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const BuildAppBarButtons({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(width: 1.w, color: Colors.white60)),
        child: Text(
          title,
          style: Nunito.body(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
