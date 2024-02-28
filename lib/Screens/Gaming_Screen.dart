// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:corllel/Common_Screens/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class GamingScreen extends StatefulWidget {
  const GamingScreen({Key? key}) : super(key: key);

  @override
  State<GamingScreen> createState() => _GamingScreenState();
}
//corected by saravanan
bool _isHovered = false;
bool _isHovered1 = false;

bool isHovering1ndVideo = false;

bool isHovering2ndVideo = false;

bool isHoveringBigVideo = false;

class _GamingScreenState extends State<GamingScreen> {
  int currentIndex = 0;
  late VideoPlayerController _controller;
  late VideoPlayerController _controller1;
  late VideoPlayerController bigScreenVideoController;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _controller =
        // ignore: deprecated_member_use
        VideoPlayerController.network('assets/images/shortvideo1.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
    super.initState();
    _controller1 =
        // ignore: deprecated_member_use
        VideoPlayerController.network('assets/images/shortvideo2.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
    super.initState();
    bigScreenVideoController =
        // ignore: deprecated_member_use
        VideoPlayerController.network('assets/images/bigscreen1.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 10,
            ),
            Center(
              child: Text(
                'Discover the new world of Metaverse',
                style: GoogleFonts.oxygen(
                  color: const Color(0xffFF40E5),
                  fontSize: width * 0.016,
                ),
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Center(
              child: Text(
                'by blending the physical\n and digital worlds',
                textAlign: TextAlign.center,
                style: GoogleFonts.montaga(
                  color: const Color(0xffF8F8F8),
                  fontSize: width * 0.040,
                ),
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Center(
              child: Text(
                'Lorem ipsum dolor sit amet consectetur.\nAdipiscing etiam odio etiam vitae dictum',
                textAlign: TextAlign.center,
                style: GoogleFonts.oxygen(
                  color: const Color(0xffF8F8F8),
                  fontSize: width * 0.016,
                ),
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            ClipPath(
              clipper: MyClipper(),
              // ignore: avoid_unnecessary_containers
              child: Container(
                // decoration: BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Vector1.png',
                            height: height / 2,
                          ),
                          SizedBox(width: width / 25),
                          Image.asset(
                            'assets/images/Vector2.png',
                            height: height / 2,
                          ),
                          SizedBox(width: width / 25),
                          Image.asset(
                            'assets/images/Vector3.png',
                            fit: BoxFit.fill,
                            height: height / 2,
                            width: width / 5,
                          ),
                          SizedBox(width: width / 25),
                          Image.asset('assets/images/Vector4.png',
                              height: height / 2),
                          SizedBox(width: width / 25),
                          Image.asset('assets/images/Vector5.png',
                              height: height / 2),
                          // SizedBox(width: width / 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1F1F1F),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/experience.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.white,
                ),
                height: height / 1.5,
                width: width / 1.1,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.black.withOpacity(0.2),
                        child: Padding(
                          padding: EdgeInsets.only(top: 0, right: width / 6),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Experience the people and\nthings around us',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.oxygen(
                                      color: const Color(0xffF8F8F8),
                                      fontSize: width * 0.023,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Enter the metaverse and play interactive games, explore endless virtual worlds,\n and make your own avatar. Engage in epic adventures over a variety of virtual\n   environments, unleash your creativity, and connect with gamers worldwide. ',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.oxygen(
                                    color: const Color(0xffF8F8F8),
                                    fontSize: width * 0.016,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _controller.value.isInitialized
                      ? MouseRegion(
                          onHover: (event) {
                            setState(() {
                              isHovering1ndVideo = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              isHovering1ndVideo = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffFF40E5), width: 3),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xffFF40E5),
                                    offset: Offset(.0, .0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black),
                            child: Stack(children: [
                              SizedBox(
                                width: width / 5,
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      child: VideoPlayer(_controller)),
                                ),
                              ),
                              Positioned.fill(
                                child: Visibility(
                                  visible: isHovering1ndVideo,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    },
                                    child: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause_circle_outline_outlined
                                          : Icons.play_arrow_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    width: width / 70,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: width / 16),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Outlines.png',
                          width: width / 8,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 90.0, right: width / 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Join us as we explore the future',
                          style: GoogleFonts.montaga(
                            color: const Color(0xffFF40E5),
                            fontSize: width * 0.023,
                          ),
                        ),
                        SizedBox(
                          height: height / 28,
                        ),
                        Text(
                          'Establish open areas for gamers to\n congregate, exchange stories, and engage in\n online social interactions within the\n metaverse',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oxygen(
                              color: const Color(0xffFFFFFF),
                              fontSize: width * 0.014,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Vector.png',
                  width: width / 2.5,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 10, top: width / 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Investigate the unimageable area',
                          style: GoogleFonts.montaga(
                            color: const Color(0xffFF40E5),
                            fontSize: width * 0.023,
                          ),
                        ),
                        SizedBox(
                          height: height / 28,
                        ),
                        Text(
                          'A complex and captivating plot that travels\n through several metaverse planes or kingdoms',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oxygen(
                              color: const Color(0xffFFFFFF),
                              fontSize: width * 0.014,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'assets/images/Outline_right.png',
                      width: width / 8,
                      // height: height/2,
                    ),
                  ),
                  SizedBox(
                    width: width / 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: _controller1.value.isInitialized
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: MouseRegion(
                              onHover: (event) {
                                setState(() {
                                  isHovering2ndVideo = true;
                                });
                              },
                              onExit: (event) {
                                setState(() {
                                  isHovering2ndVideo = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffFF40E5), width: 3),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffFF40E5),
                                      offset: Offset(.0, .0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black,
                                ),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: width / 5,
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                          child: VideoPlayer(_controller1),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible:
                                            isHovering2ndVideo, // Show the button only when hovering

                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            setState(() {
                                              _controller1.value.isPlaying
                                                  ? _controller1.pause()
                                                  : _controller1.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller1.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        // ignore: avoid_unnecessary_containers
                        : Container(
                            child: const Text("ERROR"),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1F1F1F),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/explore.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.white,
                ),
                height: height / 1.9,
                width: width / 1.1,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.black.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, right: 00),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'In virtual worlds that imitate physical settings, users can\n connect. These areas, which could be anything from magical\n landscapes to future metropolis, offer a visually stimulating\n setting for social interactions',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.oxygen(
                                    color: const Color(0xffF8F8F8),
                                    fontSize: width * 0.016,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Your Join Now button onPressed function
                                  },
                                  style: ElevatedButton.styleFrom(
                                      // foregroundColor: const Color(0xFFFF40E5),
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        side: const BorderSide(
                                          color: Color(0xFFFF40E5),
                                        ),
                                      )),
                                  child: Text(
                                    'Explore',
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xFFFF40E5),
                                      fontSize: width * 0.011,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'In virtual worlds that imitate physical settings, users can\n connect. These areas, which could be anything from magical\n landscapes to future metropolis, offer a visually stimulating',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.oxygen(
                                    color: const Color(0xffF8F8F8),
                                    fontSize: width * 0.016,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            bigScreenVideoController.value.isInitialized
                ? MouseRegion(
                    onHover: (event) {
                      setState(() {
                        isHoveringBigVideo = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        isHoveringBigVideo = false;
                      });
                    },
                    child: Container(
                      width: width / 1,
                      height: height / 1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent, width: 3),
                        // borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: width,
                            child: AspectRatio(
                              aspectRatio: 16 / 10,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: VideoPlayer(bigScreenVideoController),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Visibility(
                              visible: isHoveringBigVideo,
                              child: FloatingActionButton(
                                backgroundColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    bigScreenVideoController.value.isPlaying
                                        ? bigScreenVideoController.pause()
                                        : bigScreenVideoController.play();
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Icon(
                                    bigScreenVideoController.value.isPlaying
                                        ? Icons.pause_circle_outline_outlined
                                        : Icons.play_circle_outline_outlined,
                                    // size: width / 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                // ignore: avoid_unnecessary_containers
                : Container(
                    child: const Text("ERROR"),
                  ),
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    onHover: (hovering) {
                      setState(() => _isHovered = hovering);
                    },
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: _isHovered
                              ? 0.8
                              : 1.0, // Adjust the opacity as needed
                          child: SizedBox(
                            width: width / 4.5,
                            child: Image.asset(
                              'assets/images/immerse1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              height: _isHovered ? 100 : 0,
                              alignment: Alignment.bottomCenter,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: _isHovered
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Lorem ipsum dolor sit amet consectetur. ',
                                            style: GoogleFonts.montaga(
                                                color: const Color(0xffFF40E5),
                                                fontSize: width * 0.010),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Lorem ipsum dolor sit amet consectetur. Sit suscipit pellentesque\n suspendisse amet ornare varius tristique tempor neque.',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montaga(
                                                color: const Color(0xff0E0E0E),
                                                fontSize: width * 0.0065),
                                          ),
                                        ],
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 240),
                    child: InkWell(
                      onTap: () {},
                      onHover: (hovering) {
                        setState(() => _isHovered1 = hovering);
                      },
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: _isHovered1
                                ? 0.8
                                : 1.0, // Adjust the opacity as needed
                            child: SizedBox(
                              width: width / 4.5,
                              child: Image.asset(
                                'assets/images/immerse2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -20,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: _isHovered1 ? 100 : 0,
                                alignment: Alignment.bottomCenter,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: _isHovered1
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Lorem ipsum dolor sit amet consectetur. ',
                                              style: GoogleFonts.montaga(
                                                  color:
                                                      const Color(0xffFF40E5),
                                                  fontSize: width * 0.010),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Lorem ipsum dolor sit amet consectetur. Sit suscipit pellentesque\n suspendisse amet ornare varius tristique tempor neque.',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montaga(
                                                  color:
                                                      const Color(0xff0E0E0E),
                                                  fontSize: width * 0.0065),
                                            ),
                                          ],
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 100),
                    child: Column(
                      children: [
                        Text(
                          'Immerse yourself into the\n world’s richest history',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montaga(
                              color: const Color(0xffF8F8F8),
                              fontSize: width * 0.02),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'No matter where you are, take use of VR exhibitions, AR products and filters, 3D\n models, art galleries, and other cultural institutions.  explore the magnificent Barrier\n Reef or acquire a deeper understanding of art and culture',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oxygen(
                              color: const Color(0xffF8F8F8),
                              fontSize: width * 0.011),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FooterSection()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller1.dispose();
    bigScreenVideoController.dispose();
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height / 1.18, size.width / 2, size.height / 1.18);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height / 1.18, size.width, size.height);
    path.lineTo(size.width,
        size.height / 4); // Adjusted to start from the top-right corner

    path.quadraticBezierTo(
        3 * size.width / 2, size.height / 2, size.width / 1, size.height / 20);
    path.quadraticBezierTo(size.width / 2, size.height / 4, size.height,
        size.height / 10); // Added curve to the top-left corner

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
