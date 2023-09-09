import 'package:bccm_player/bccm_player.dart';
import 'package:flutter/material.dart';

class FeaturedOverview extends StatefulWidget {
  const FeaturedOverview({super.key});

  @override
  State<FeaturedOverview> createState() => _FeaturedOverviewState();
}

class _FeaturedOverviewState extends State<FeaturedOverview> {
  late BccmPlayerController playerController;

  @override
  void initState() {
    // You can also use the global "primary" controller: BccmPlayerController.primary;
    // The primary player has superpowers like notification player, background playback, casting, etc.
    playerController = BccmPlayerController(
      MediaItem(
        url:
            'https://devstreaming-cdn.apple.com/videos/streaming/examples/adv_dv_atmos/main.m3u8',
        mimeType: 'application/x-mpegURL',
        metadata: MediaMetadata(title: 'Apple advanced (HLS/HDR)'),
      ),
    );
    playerController.initialize().then((_) {
      playerController.setPrimary();
    });
    super.initState();
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
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
            children: [
              BccmPlayerView(
                playerController,
              ),
              ElevatedButton(
                onPressed: () {
                  playerController.setPrimary();
                },
                child: const Text('Make primary'),
              ),
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
