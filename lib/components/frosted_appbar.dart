import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflixui/utils/custom_tap.dart';

class FrostedAppBar extends StatefulWidget {
  //
  final double height;
  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final Color color;
  final double blurStrengthX;
  final double blurStrengthY;
  //constructor
  FrostedAppBar({
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
  _FrostedAppBarState createState() => _FrostedAppBarState();
}

class _FrostedAppBarState extends State<FrostedAppBar> {
  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            // will be 10 by default if not provided
            sigmaX: widget.blurStrengthX ?? 10,
            sigmaY: widget.blurStrengthY ?? 10,
          ),
          child: Container(
            color: widget.color, //test
            alignment: Alignment.center,
            width: scrSize.width,
            height: widget.height ?? 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 16,
                      color: Colors.transparent,
                      child: widget.leading,
                    ),
                    Expanded(
                      child: widget.title ?? Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        children: widget.actions ??
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTap(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 0.7, color: Colors.white60)),
                          child: Text(
                            "Tv Shows",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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
                              border: Border.all(
                                  width: 0.7, color: Colors.white60)),
                          child: Text(
                            "Movies",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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
                              border: Border.all(
                                  width: 0.7, color: Colors.white60)),
                          child: Row(
                            children: [
                              Text(
                                "Categories",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "helvetica",
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
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
      ), // to clip the container
    );
  }
}
