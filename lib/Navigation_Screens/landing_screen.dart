import 'package:beamer/beamer.dart';
import 'package:corllel/Common_Screens/footer.dart';
import 'package:corllel/Round_Animation.dart';
import 'package:corllel/Screens/Home_Screen.dart';
import 'package:corllel/Screens/MetaWorld_Screen.dart';
import 'package:corllel/Screens/Gaming_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _beamerKey = GlobalKey<BeamerState>();
  bool hasNavigatedToLanding = false;

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    print("Prathap${path}");

    // Check if the current path is "*"
    final bool isHome = path == "/";

    return Scaffold(
      body: Column(
        children: [
          if (!isHome)
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: SideNav(beamer: _beamerKey),
            ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Beamer(
                key: _beamerKey,
                routerDelegate: BeamerDelegate(
                  locationBuilder: RoutesLocationBuilder(
                    routes: {
                      '*': (context, state, data) => const RoundAnimation(),
                      '/home': (context, state, data) => const BeamPage(
                            key: ValueKey('Home'),
                            type: BeamPageType.scaleTransition,
                            child: HomePageScreen(),
                          ),
                      '/gaming': (context, state, data) => const BeamPage(
                            key: ValueKey('Gaming'),
                            type: BeamPageType.scaleTransition,
                            child: GamingScreen(),
                          ),
                      '/metaworld': (context, state, data) => const BeamPage(
                            key: ValueKey('MetaWorld'),
                            type: BeamPageType.scaleTransition,
                            child: MetaWorldScreen(),
                          ),
                      '/contact': (context, state, data) => const BeamPage(
                            key: ValueKey('Contact'),
                            type: BeamPageType.scaleTransition,
                            child: FooterSection(),
                          ),
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideNav extends StatefulWidget {
  final GlobalKey<BeamerState> beamer;
  const SideNav({Key? key, required this.beamer}) : super(key: key);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selected = -1;

  @override
  void initState() {
    super.initState();
  }

  List<String> navItems = ['Home', 'Gaming', 'MetaWorld', 'Contact'];
  List<String> navs = ['/home', '/gaming', '/metaworld', '/contact'];

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    print('path $path');
    print("Selected${selected}");
    if (path.contains('/home')) {
      selected = 0;
    } else if (path.contains('/gaming')) {
      selected = 1;
    } else if (path.contains('/metaworld')) {
      selected = 2;
    } else if (path.contains('/contact')) {
      selected = 3;
    }
    return Visibility(
      visible: selected != -1, // Hide when path is "*"
      child: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 14),
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
                children: navItems.map((navItem) {
                  final index = navItems.indexOf(navItem);
                  final isContact = index == 3;

                  return AnimatedContainer(
                    key: ValueKey(navItem),
                    duration: const Duration(milliseconds: 375),
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: isContact
                          ? Colors.white
                          : const Color.fromARGB(255, 11, 11, 11),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.beamer.currentState?.routerDelegate
                                .beamToNamed(navs[navItems.indexOf(navItem)]);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.sizeOf(context).width / 70,
                              vertical: MediaQuery.sizeOf(context).height / 80),
                          child: Center(
                            child: Text(
                              navItem,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.012,
                                color: isContact
                                    ? Colors.black
                                    : selected == navItems.indexOf(navItem)
                                        ? const Color(0xFFFF40E5)
                                        : const Color(0xFFFF40E5),
                                decoration: TextDecoration.underline,
                                decorationColor: isContact
                                    ? Colors.white
                                    : selected == navItems.indexOf(navItem)
                                        ? const Color(0xFFFF40E5)
                                        : const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
