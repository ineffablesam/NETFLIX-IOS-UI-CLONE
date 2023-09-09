import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../Common/utils/custom_tap.dart';

class FrostedAppBar extends StatelessWidget {
  final double height;
  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final Color color;
  final double blurStrengthX;
  final double blurStrengthY;
  const FrostedAppBar({
    super.key,
    required this.height,
    required this.actions,
    required this.blurStrengthX,
    required this.blurStrengthY,
    required this.color,
    required this.leading,
    required this.title,
  });
  //
  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery.of(context).size;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16.7,
          sigmaY: 16.7,
        ),
        child: Container(
          color: color, //test
          alignment: Alignment.center,
          width: scrSize.width,
          height: height ?? 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    color: Colors.transparent,
                    child: leading,
                  ),
                  Expanded(
                    child: title ?? Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: actions ??
                          [
                            Container(
                              width: 50,
                            )
                          ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTap(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 0.7, color: Colors.white60)),
                        child: Text(
                          "Tv Shows",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "helvetica",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTap(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 0.7, color: Colors.white60)),
                        child: Text(
                          "Movies",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: "helvetica",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTap(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 0.7, color: Colors.white60)),
                        child: Row(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "helvetica",
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
