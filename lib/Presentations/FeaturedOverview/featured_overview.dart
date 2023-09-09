import 'package:flutter/material.dart';

class FeaturedOverview extends StatelessWidget {
  const FeaturedOverview({super.key});

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
            children: [
              // create layout for testing scroll

              Container(
                height: 1000,
                color: const Color(0xFF000000),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
