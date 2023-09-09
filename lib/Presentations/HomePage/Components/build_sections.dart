import 'dart:math';

import 'package:flutter/material.dart';

import '../../../Common/utils/custom_tap.dart';

class BuildHorizontalSlider extends StatelessWidget {
  const BuildHorizontalSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, int i) {
            // Generate a random number between 1 and 100 to use as a seed for the image URL
            final randomNumber = Random().nextInt(100) + 1;
            final imageUrl =
                "https://picsum.photos/200/300?random=$randomNumber";

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
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style:
                const TextStyle(fontFamily: "helvetica", color: Colors.white),
          ),
        ],
      ),
    );
  }
}
