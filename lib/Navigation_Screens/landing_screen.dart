import 'package:beamer/beamer.dart';
import 'package:corllel/Screens/Home_Screen.dart';
import 'package:corllel/Screens/Contact_Screen.dart';
import 'package:corllel/Screens/MetaWorld_Screen.dart';
import 'package:corllel/Screens/Gaming_Screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _beamerKey = GlobalKey<BeamerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
              // margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: SideNav(beamer: _beamerKey)),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              // margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0))),
              child: Beamer(
                key: _beamerKey,
                routerDelegate: BeamerDelegate(
                  // NOTE First Method
                  locationBuilder: RoutesLocationBuilder(
                    routes: {
                      '*': (context, state, data) => const BeamPage(
                            key: ValueKey('Home'),
                            type: BeamPageType.scaleTransition,
                            child: HomePageScreen(),
                          ),
                      // '/settings': (context, state, data) {
                      //   print(state.pathPatternSegments);
                      //   if (state.pathPatternSegments.contains('account')) {
                      //     return BeamPage(
                      //       key: ValueKey('AccountsSettings - ${DateTime.now()}'),
                      //       type: BeamPageType.scaleTransition,
                      //       child: const AccountSettings(),
                      //     );
                      //   } else if (state.pathPatternSegments
                      //       .contains('profile')) {
                      //     return BeamPage(
                      //       key: ValueKey('ProfileSettings - ${DateTime.now()}'),
                      //       type: BeamPageType.scaleTransition,
                      //       child: const ProfileSettings(),
                      //     );
                      //   }
                      //   return BeamPage(
                      //     key: ValueKey('Settings - ${DateTime.now()}'),
                      //     type: BeamPageType.scaleTransition,
                      //     child: const Settings(),
                      //   );
                      // },
                      // '/home': (context, state, data) => const BeamPage(
                      //       key: ValueKey('Home'),
                      //       type: BeamPageType.scaleTransition,
                      //       child: Dashboard(),
                      //     ),
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
                            child: ContactScreen(),
                          ),
                    },
                  ),

                  // NOTE Secondary Method
                  // locationBuilder: (routeInfo, data) {
                  //   if (routeInfo.location!.contains('dashboard')) {
                  //     return DashboardLocation(routeInfo);
                  //   }
                  //   if (routeInfo.location!.contains('settings')) {
                  //     return SettingsLocation(routeInfo);
                  //   }
                  //   if (routeInfo.location!.contains('profile')) {
                  //     return ProfileLocation(routeInfo);
                  //   }
                  //   if (routeInfo.location!.contains('notifications')) {
                  //     return NotificationLocation(routeInfo);
                  //   }
                  //   if (routeInfo.location!.contains('about')) {
                  //     return AboutLocation(routeInfo);
                  //   }
                  //   return NotFound(path: routeInfo.location!.toString());
                  // },
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

  List<String> navItems = [
    'Home',
    // 'Settings',
    'Gaming',
    'MetaWorld',
    'Contact'
  ];
  List<String> navs = [
    '/home',
    // '/settings',
    '/gaming',
    '/metaworld',
    '/contact'
  ];

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    print('path $path');
    if (path.contains('/home')) {
      selected = 0;
    }
    //  else if (path.contains('/settings')) {
    //   selected = 1;
    // }
    else if (path.contains('/gaming')) {
      selected = 1;
    } else if (path.contains('/metaworld')) {
      selected = 2;
    } else if (path.contains('/contact')) {
      selected = 3;
    }
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width / 14),
        child: Row(
          children: [
            const Text(
              "corllel",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 26),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: navItems.map((navItem) {
                final index = navItems.indexOf(navItem);
                final isContact = index == 3; // Index of "Contact" navItem

                return AnimatedContainer(
                    key: ValueKey(navItem),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   color: selected == navItems.indexOf(navItem)
                    //       ? Colors.grey[850]
                    //       : Colors.white,
                    // ),
                    duration: const Duration(
                      milliseconds: 375,
                    ),
                    // width: 120.0,
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: isContact
                          ? Colors.white // White background for "Contact"
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 9),
                          child: Center(
                            child: Text(
                              navItem,
                              style: TextStyle(
                                // fontSize:
                                // MediaQuery.sizeOf(context).width * 0.015,
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
                    ));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
