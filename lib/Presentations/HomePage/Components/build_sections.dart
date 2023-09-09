import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflixui/Common/utils/Text/helvetica.dart';

import '../../../Common/utils/custom_tap.dart';

class BuildHorizontalSlider extends StatelessWidget {
  const BuildHorizontalSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, int i) {
            final randomNumber = Random().nextInt(100) + 1;
            final imageUrl =
                "https://picsum.photos/200/300?random=$randomNumber&grayscale";

            return CustomTap(
              end: 0.97,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF151515),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 270,
                    width: 130,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class buildSectionTitle extends StatelessWidget {
  final String title;
  const buildSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 7.w),
      child: Row(
        children: [
          Text(
            title,
            style: Helvetica.body(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
