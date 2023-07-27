import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart' hide Card;
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:motion/motion.dart';
import 'package:netflixui/utils/custom_tap.dart';

import 'components/frosted_appbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(60.fps);
  await FlutterDisplayMode.setHighRefreshRate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Motion.instance.isPermissionRequired &&
        !Motion.instance.isPermissionGranted) {
      showPermissionRequestDialog(
        context,
        onDone: () {
          setState(() {});
        },
      );
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff0000),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 18,
            sigmaY: 18,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black87,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection_outlined,
                  color: Colors.grey.shade800,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  color: Colors.grey.shade800,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [Color(0xe5c41313), Colors.transparent],
                    stops: [0, 1],
                  ),
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Center(
                    child: CustomTap(
                      end: 0.99,
                      child: Motion.elevated(
                        glare: true,
                        elevation: 70,
                        borderRadius: BorderRadius.circular(13),
                        child: Stack(
                          children: [
                            Container(
                              width: 330,
                              height: 470,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white38, width: 0.3),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/power.jpeg")),
                                color: const Color(0xff2f2c30),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              right: 10,
                              left: 10,
                              child: Center(
                                child: Motion.only(
                                  shadow: const ShadowConfiguration(opacity: 0),
                                  controller: MotionController(damping: 1),
                                  translation: const TranslationConfiguration(),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 42, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              'Play',
                                              style: TextStyle(
                                                fontFamily: "Helvetica",
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 32, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Color(0xEA101010),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              'My List',
                                              style: TextStyle(
                                                fontFamily: "Helvetica",
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
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
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              _buildSectionTitle(
                title: "Continue Watching for Samuel Philip",
              ),
              BuildHorizontalSlider(),
              _buildSectionTitle(
                title: "Popular on Netflix",
              ),
              BuildHorizontalSlider(),
              _buildSectionTitle(
                title: "Trending Now",
              ),
              BuildHorizontalSlider(),

              // Footer Padding
              SizedBox(
                height: 40,
              )
            ]),
          ),
          FrostedAppBar(
            blurStrengthX: 18,
            blurStrengthY: 18,
            title: Text(
              'For Samuel Philip',
              style: TextStyle(
                  fontFamily: "helvetica", fontSize: 20, color: Colors.white),
            ),
            height: 110,
            actions: [
              Icon(
                Icons.search,
                color: Colors.white,
              )
            ],
            color: Colors.transparent,
            leading: Text(""),
          ),
        ],
      ),
    );
  }

  Future<void> showPermissionRequestDialog(BuildContext context,
      {required Function() onDone}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Permission required'),
              content: const Text(
                  'On iOS 13+, you need to grant access to the gyroscope. A permission will be requested to proceed.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Motion.instance.requestPermission();
                  },
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}

class BuildHorizontalSlider extends StatelessWidget {
  const BuildHorizontalSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          physics: BouncingScrollPhysics(),
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
                      color: Color(0xFF151515),
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

class _buildSectionTitle extends StatelessWidget {
  final String title;
  const _buildSectionTitle({
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
            style: TextStyle(fontFamily: "helvetica", color: Colors.white),
          ),
        ],
      ),
    );
  }
}
