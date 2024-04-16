// ignore_for_file: deprecated_member_use, file_names

// import 'package:corllel/Common_Screens/footer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:corllel/Common_Screens/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:video_player/video_player.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

bool condition = true;

bool isHovering1ndVideo = false;
bool isHovering2ndVideo = false;
bool isHoveringBigVideo = false;

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;

  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late VideoPlayerController _controller5;
  late bool _isPlaying1;
  late bool _isPlaying2;
  late bool _isPlaying3;
  late bool _isPlaying4;
  late bool _isPlaying5;
  late ScrollController _scrollController;

  late ScrollController scrollControllerBottom;

  @override
  void initState() {
    super.initState();
    scrollControllerBottom = ScrollController();
    // prathap(context);

    _controller =
        VideoPlayerController.network('assets/images/DigAmenD full service.mp4')
          ..initialize().then((_) {
            setState(() {});
          });

    _controller2 =
        VideoPlayerController.network('assets/images/DigAmenD full service.mp4')
          ..initialize().then((_) {
            setState(() {});
          });

    _controller3 =
        VideoPlayerController.network('assets/images/DigAmenD full service.mp4')
          ..initialize().then((_) {
            setState(() {});
          });

    _controller4 =
        VideoPlayerController.network('assets/images/DigAmenD full service.mp4')
          ..initialize().then((_) {
            setState(() {});
          });

    _controller5 =
        VideoPlayerController.network('assets/images/DigAmenD full service.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
    _isPlaying1 = false;
    _isPlaying2 = false;
    _isPlaying3 = false;
    _isPlaying4 = false;
    _isPlaying5 = false;
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  // void prathap(BuildContext context) {
  //   if (!hasNavigated) {
  //     Future.delayed(const Duration(seconds: 0), () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const LandingScreen()),
  //       );
  //     });
  //     print("Navigated to LandingScreen");
  //     setState(() {
  //       hasNavigated = true;
  //     });
  //     print("hasNavigated set to ${hasNavigated}");
  //   }
  // }

  // void refreshPage(BuildContext context) {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePageScreen()),
  //     );
  //   });
  // }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _playPauseVideo1() {
    if (_isPlaying1 = true) {
      _controller2.pause();
      _controller3.pause();
      _controller4.pause();
      _controller5.pause();
    }
  }

  void _playPauseVideo2() {
    if (_isPlaying2 = true) {
      _controller.pause();
      _controller3.pause();
      _controller4.pause();
      _controller5.pause();
    }
  }

  void _playPauseVideo3() {
    if (_isPlaying3 = true) {
      _controller.pause();
      _controller2.pause();
      _controller4.pause();
      _controller5.pause();
    }
  }

  void _playPauseVideo4() {
    if (_isPlaying4 = true) {
      _controller.pause();
      _controller2.pause();
      _controller3.pause();
      _controller5.pause();
    }
  }

  void _playPauseVideo5() {
    if (_isPlaying5 = true) {
      _controller.pause();
      _controller2.pause();
      _controller3.pause();
      _controller4.pause();
    }
  }

  void _handleScroll() {
    if ((_isPlaying1 ||
            _isPlaying2 ||
            _isPlaying3 ||
            _isPlaying4 ||
            _isPlaying5) &&
        mounted &&
        _scrollController.hasClients) {
      final double bottomPosition1 = _scrollController.offset +
          _scrollController.position.viewportDimension;
      final double bottomPosition2 = _scrollController.offset +
          _scrollController.position.viewportDimension;
      final double bottomPosition3 = _scrollController.offset +
          _scrollController.position.viewportDimension;
      final double topPosition1 = _scrollController.offset;
      final double topPosition2 = _scrollController.offset;
      final double topPosition3 = _scrollController.offset;

      if ((topPosition1 > _controller.value.size.height / 2 &&
              bottomPosition1 > _controller.value.size.height / 2) ||
          (topPosition2 > _controller2.value.size.height &&
              bottomPosition2 > _controller2.value.size.height) ||
          (topPosition3 > _controller3.value.size.height &&
              bottomPosition3 > _controller3.value.size.height) ||
          (topPosition3 > _controller4.value.size.height &&
              bottomPosition3 > _controller4.value.size.height) ||
          (topPosition3 > _controller5.value.size.height &&
              bottomPosition3 > _controller5.value.size.height)) {
        setState(() {
          _isPlaying1 = false;
          _isPlaying2 = false;
          _isPlaying3 = false;
          _isPlaying4 = false;
          _isPlaying5 = false;
          _controller.pause();
          _controller2.pause();
          _controller3.pause();
          _controller4.pause();
          _controller5.pause();
        });
      }
    }
  }

  bool isHovering1ndVideo = false;
  bool isHovering2 = false;
  bool isHovering3 = false;
  bool isHovering4 = false;
  bool isHovering5 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollControllerBottom,
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 14,
                    vertical: height / 30),
                child: Row(
                  children: [
                    Text(
                      "Corllel",
                      style: GoogleFonts.montaga(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: MediaQuery.sizeOf(context).width * 0.02),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // Close the drawer
                            Navigator.pop(context);
                            // Navigate to the Home screen
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text(
                            "Home",
                            style: GoogleFonts.oxygen(
                                fontSize: width * 0.012,
                                color: const Color(0xFFFF40E5),
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0xFFFF40E5)),
                          ),
                        ),
                        SizedBox(
                          width: width / 35,
                        ),
                        InkWell(
                          onTap: () {
                            // Close the drawer
                            Navigator.pop(context);
                            // Navigate to the Home screen
                            Navigator.pushNamed(context, '/metaworld');
                          },
                          child: Text(
                            "MetaWorld",
                            style: GoogleFonts.oxygen(
                              fontSize: width * 0.012,
                              color: const Color(0xFFFF40E5),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 35,
                        ),
                        InkWell(
                          onTap: () {
                            // Close the drawer
                            Navigator.pop(context);
                            // Navigate to the Home screen
                            Navigator.pushNamed(context, '/gaming');
                          },
                          child: Text(
                            "Gaming",
                            style: GoogleFonts.oxygen(
                              fontSize: width * 0.012,
                              color: const Color(0xFFFF40E5),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 35,
                        ),
                        InkWell(
                          onTap: () {
                            _scrollToYellowContainer();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 100,
                                  vertical: height / 80),
                              child: Text(
                                "Contact",
                                style: GoogleFonts.oxygen(
                                  fontSize: width * 0.012,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Discover the new world",
                            style: GoogleFonts.oxygen(
                                fontSize: width * 0.018,
                                color: const Color(0xFFFF40E5))),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          " Dream it, See it and\nExperience it through",
                          style: GoogleFonts.montaga(
                              fontSize: width * 0.043, color: Colors.white),
                        ),
                        Image.asset(
                          "assets/images/cgif.gif",
                          height: width*0.08,
                          width: width/5,
                        ),
                        ColorizeAnimatedTextKit(
                          totalRepeatCount: Duration.microsecondsPerMillisecond,
                          text: const [
                            "Corllel",
                          ],
                          textStyle: GoogleFonts.montaga(
                            fontSize: width * 0.042,
                          ),
                          colors: const [
                            Color(0xFFFF40E5),
                            Colors.white,
                          ],
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: height / 35,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width / 2.1,
                    height: height / 1.1,
                    child: Image.asset(
                      'assets/images/k1.png',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ScrollLoopAutoScroll(
                      duration: const Duration(seconds: 15),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: <Widget>[
                        Text(
                          'Corllel',
                          style: GoogleFonts.montaga(
                              fontSize: width * 0.02, color: Colors.white),
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Image.asset('assets/images/cube.png',
                            height: height / 12),
                      ]),
                    ),
                  ]),
              SizedBox(
                height: height / 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "About us",
                    style: GoogleFonts.oxygen(
                      fontSize: width * 0.04,
                      color: const Color(0xFFFF40E5),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.051, right: width * 0.051),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 2.8,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/j2.png"))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03, vertical: width * 0.022),
                        child: Column(
                          children: [
                            Text(
                              "Our Story",
                              style: GoogleFonts.oxygen(
                                  fontSize: width * 0.02, color: Colors.white),
                            ),
                            SizedBox(
                              height: height / 30,
                            ),
                            Text(
                              "Welcome to Digamend, where imagination meets innovation in the world of Entertainment, Virtual Reality (VR), and Gaming.At Digamend, we're passionate about creating unforgettable experiences that transport you to new realms and redefine the boundaries of entertainment. ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.oxygen(
                                  fontWeight: FontWeight.w100,
                                  fontSize: width * 0.014,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width / 2.8,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/j2.png"))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: width * 0.012),
                        child: Column(
                          children: [
                            Text(
                              "Our Mission",
                              style: GoogleFonts.oxygen(
                                  fontSize: width * 0.02, color: Colors.white),
                            ),
                            SizedBox(
                              height: height / 30,
                            ),
                            Text(
                              "Our mission is simple yet ambitious: to revolutionize the way you experience entertainment. We strive to push the boundaries of creativity and technology, bringing you cutting-edge experiences that captivate your senses and leave you craving more. Immersive VR Experiences, Gaming Excellence, Pushing the Boundaries of Innovation.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.oxygen(
                                  fontWeight: FontWeight.w100,
                                  fontSize: width * 0.014,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 13,
              ),
              Padding(
                padding: const EdgeInsets.all(48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: width / 4.3,
                          child: _controller.value.isInitialized
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
                                  child: Stack(children: [
                                    SizedBox(
                                      width: width / 4.3,
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          child: _buildVideoPlayer(_controller,
                                              _isPlaying1, _playPauseVideo1),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: !isHovering1ndVideo &&
                                            !_controller.value
                                                .isPlaying, // Show the button only when hovering

                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo1();
                                            setState(() {
                                              _controller.value.isPlaying
                                                  ? _controller.pause()
                                                  : _controller.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: isHovering1ndVideo,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo1();
                                            setState(() {
                                              _controller.value.isPlaying
                                                  ? _controller.pause()
                                                  : _controller.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                )
                              : Container(),
                        ),
                        SizedBox(
                          height: height / 15,
                        ),
                        SizedBox(
                          width: width / 4.3,
                          child: _controller2.value.isInitialized
                              ? MouseRegion(
                                  onHover: (event) {
                                    setState(() {
                                      isHovering2 = true;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      isHovering2 = false;
                                    });
                                  },
                                  child: Stack(children: [
                                    SizedBox(
                                      width: width / 4.3,
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            child: _buildVideoPlayer(
                                                _controller2,
                                                _isPlaying2,
                                                _playPauseVideo2)),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: !isHovering2 &&
                                            !_controller2.value.isPlaying,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo2();
                                            setState(() {
                                              _controller2.value.isPlaying
                                                  ? _controller2.pause()
                                                  : _controller2.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller2.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: isHovering2,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo2();
                                            setState(() {
                                              _controller2.value.isPlaying
                                                  ? _controller2.pause()
                                                  : _controller2.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller2.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width / 2.8,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _controller3.value.isInitialized
                                ? MouseRegion(
                                    onHover: (event) {
                                      setState(() {
                                        isHovering3 = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        isHovering3 = false;
                                      });
                                    },
                                    child: Stack(children: [
                                      SizedBox(
                                        width: width / 2.8,
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                              child: _buildVideoPlayer(
                                                  _controller3,
                                                  _isPlaying3,
                                                  _playPauseVideo3)),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Visibility(
                                          visible: !isHovering3 &&
                                              !_controller3.value.isPlaying,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.transparent,
                                            onPressed: () {
                                              _playPauseVideo3();
                                              setState(() {
                                                _controller3.value.isPlaying
                                                    ? _controller3.pause()
                                                    : _controller3.play();
                                              });
                                            },
                                            child: Icon(
                                              _controller3.value.isPlaying
                                                  ? Icons
                                                      .pause_circle_outline_outlined
                                                  : Icons.play_arrow_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Visibility(
                                          visible: isHovering3,
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.transparent,
                                            onPressed: () {
                                              _playPauseVideo3();
                                              setState(() {
                                                _controller3.value.isPlaying
                                                    ? _controller3.pause()
                                                    : _controller3.play();
                                              });
                                            },
                                            child: Icon(
                                              _controller3.value.isPlaying
                                                  ? Icons
                                                      .pause_circle_outline_outlined
                                                  : Icons.play_arrow_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  )
                                : Container(),
                            SizedBox(
                              height: height / 30,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore, Beyond, Boundaries.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montaga(
                                  color: Colors.white,
                                  fontSize: width * 0.024,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: width / 4.3,
                          child: _controller4.value.isInitialized
                              ? MouseRegion(
                                  onHover: (event) {
                                    setState(() {
                                      isHovering4 = true;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      isHovering4 = false;
                                    });
                                  },
                                  child: Stack(children: [
                                    SizedBox(
                                      width: width / 4.3,
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            child: _buildVideoPlayer(
                                                _controller4,
                                                _isPlaying4,
                                                _playPauseVideo4)),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: !isHovering4 &&
                                            !_controller4.value.isPlaying,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo4();
                                            setState(() {
                                              _controller4.value.isPlaying
                                                  ? _controller4.pause()
                                                  : _controller4.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller4.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: isHovering4,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo4();
                                            setState(() {
                                              _controller4.value.isPlaying
                                                  ? _controller4.pause()
                                                  : _controller4.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller4.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                )
                              : Container(),
                        ),
                        SizedBox(
                          height: height / 15,
                        ),
                        SizedBox(
                          width: width / 4.3,
                          child: _controller5.value.isInitialized
                              ? MouseRegion(
                                  onHover: (event) {
                                    setState(() {
                                      isHovering5 = true;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      isHovering5 = false;
                                    });
                                  },
                                  child: Stack(children: [
                                    SizedBox(
                                      width: width / 4.3,
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            child: _buildVideoPlayer(
                                                _controller5,
                                                _isPlaying5,
                                                _playPauseVideo5)),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: !isHovering2ndVideo &&
                                            !_controller5.value.isPlaying,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo5();
                                            setState(() {
                                              _controller5.value.isPlaying
                                                  ? _controller5.pause()
                                                  : _controller5.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller5.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Visibility(
                                        visible: isHovering5,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.transparent,
                                          onPressed: () {
                                            _playPauseVideo5();
                                            setState(() {
                                              _controller5.value.isPlaying
                                                  ? _controller5.pause()
                                                  : _controller5.play();
                                            });
                                          },
                                          child: Icon(
                                            _controller5.value.isPlaying
                                                ? Icons
                                                    .pause_circle_outline_outlined
                                                : Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 42,
              ),
              Center(
                child: Text(
                  "What can you do in corllel",
                  style: GoogleFonts.oxygen(
                      fontSize: width * 0.015, color: const Color(0xFFFF40E5)),
                ),
              ),
              SizedBox(
                height: height / 48,
              ),
              Center(
                child: Text(
                  "Corllel offers a Variety of activities for users",
                  style: GoogleFonts.montaga(
                      fontSize: width * 0.016, color: Colors.white),
                ),
              ),
              SizedBox(
                height: height / 14,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TestimonialRow(
                          imageName: 'assets/images/build.png',
                          name: 'Build your own Avatar',
                          text:
                              "Customize every detail, from hairstyle to clothing, to create a unique representation of yourself in the virtual world.",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SizedBox()),
                            );
                          },
                        ),
                        SizedBox(
                          height: height / 9,
                        ),
                        TestimonialRow(
                          imageName: 'assets/images/going.png',
                          name: 'Going Beyond Time in Virtual World',
                          text:
                              "Merge the boundaries of reality and virtuality. Immerse yourself in experiences that blur the lines between the physical and digital worlds",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SizedBox()),
                            );
                          },
                        ),
                        SizedBox(
                          height: height / 17,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TestimonialRow(
                          imageName: 'assets/images/3d.png',
                          name: '3D Models & Assets',
                          text:
                              "Collection of meticulously crafted 3D models and assets. Explore, create, and bring your visions to life with ease, thanks to our high-quality assets designed to fuel your creativity.",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SizedBox()),
                            );
                          },
                        ),
                        SizedBox(
                          height: height / 17,
                        ),
                        TestimonialRow(
                          imageName: 'assets/images/dive.png',
                          name: 'Dive Into Reality ',
                          text:
                              "Immerse yourself in the heart of epic battles and become the ultimate warrior? Get ready to experience the adrenaline rush of combat like never before.",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SizedBox()),
                            );
                          },
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Text(
                  "Building your avatar together",
                  style: GoogleFonts.montaga(
                      fontSize: width * 0.02, color: const Color(0xFFFF40E5)),
                ),
              ),
              SizedBox(
                height: height / 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width / 4.3,
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/j4.png',
                      ),
                    ),
                  ),
                  Container(
                    width: width / 3.1,
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/j.png',
                      ),
                    ),
                  ),
                  Container(
                    width: width / 4.3,
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/j6.png',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 8,
              ),
              const FooterSection(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(VideoPlayerController controller, bool isPlaying,
      VoidCallback playPauseCallback) {
    return Visibility(
      visible: controller.value.isInitialized,
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(controller),
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  playPauseCallback();
                  setState(() {
                    isPlaying ? controller.pause() : controller.play();
                  });
                },
                child: Container(color: Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToYellowContainer() {
    final double offset = scrollControllerBottom.position.maxScrollExtent;
    scrollControllerBottom.animateTo(
      offset,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
  }
}

class TestimonialRow extends StatelessWidget {
  final String imageName;
  final String name;
  final String text;
  final VoidCallback? onTap;

  const TestimonialRow({
    super.key,
    required this.imageName,
    required this.name,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageName,
          width: width * 0.05,
        ),
        SizedBox(width: width / 52),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.oxygen(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.014,
                color: Colors.white,
              ),
            ),
            SizedBox(height: height / 55),
            SizedBox(
              width: width / 3.8,
              child: Text(
                text,
                style: GoogleFonts.oxygen(
                  fontSize: width * 0.011,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: height / 60),
          ],
        ),
      ],
    );
  }
}
