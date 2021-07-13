import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation/colorsfile.dart';
import 'package:flutter_meditation/sidebar.dart';
import 'package:flutter_meditation/sleep/sleep.dart';
import 'package:flutter_meditation/yoga/models/course.dart';
import 'package:flutter_meditation/yoga/models/data.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../open.dart';

class Yoga extends StatefulWidget {
  @override
  _YogaState createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: Stack(
          children: [
            Screen(),
            Bottom(),
            NavBar(),
            SideBar(),
          ],
        ));
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    var imageName = '';
    var clr;
    if (timeNow <= 12) {
      message = 'mrng'.tr;
      imageName = 'mrng.png';
      clr = kTextColor;
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'afternoon'.tr;
      imageName = 'afternoon.jpg';
      clr = Color(0xFF222B45);
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'evng'.tr;
      imageName = 'evng.png';
      clr = Color(0xFFECE9F5);
    } else {
      message = 'night'.tr;
      imageName = 'night.png';
      clr = Color(0xFFDBD2F6);
    }

    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),

      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .30,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/$imageName"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            message,
                            style: TextStyle(
                                color: clr,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Montserrat'),
                          ),
                          SizedBox(width: 5),
                          Image.asset(
                            "assets/hi.gif",
                            height: size.height * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        'sub'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: clr,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    SizedBox(height: 60),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                const url =
                                    'https://www.youtube.com/playlist?list=PLui6Eyny-UzxMFVoPmxcPX1MOeLyV5uKQ';
                                launchURL(url);
                              },
                            );
                          },
                          child: SeassionCard(
                            seassionText: 'mrng1'.tr,
                            isDone: true,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              const url =
                                  'https://www.youtube.com/playlist?list=PL8xm_b9xYx_Dx4O_lw7Zy-FgjuDBCwhUK';
                              launchURL(url);
                            });
                          },
                          child: SeassionCard(
                            seassionText: 'afternoon1'.tr,
                            isDone: true,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              const url =
                                  'https://www.youtube.com/playlist?list=PLW0v0k7UCVrnaXSOvGHWpBRlPz_XIMpjo';
                              launchURL(url);
                            });
                          },
                          child: SeassionCard(
                            seassionText: 'evng1'.tr,
                            isDone: true,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              const url =
                                  'https://www.youtube.com/playlist?list=PLqLxQScMeIYOQJh2b-Vr2xzXp5PoitLDi';
                              launchURL(url);
                            });
                          },
                          child: SeassionCard(
                            seassionText: 'night1'.tr,
                            isDone: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final seassionText;
  final bool isDone;

  final Function press;
  const SeassionCard({
    Key key,
    this.seassionText,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: my,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: my,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("$seassionText",
                        //style: Theme.of(context).textTheme.subtitle,
                        style: TextStyle(
                          color: kBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class Bottom extends StatefulWidget {
  @override
  _Bottom createState() => _Bottom();
}

class _Bottom extends State<Bottom> {
  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Course course = courses[index];

    _launchURL() async {
      var url = course.corurl;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    color: kBlueLightColor.withOpacity(0.15),
                    blurRadius: 30.0,
                    offset: Offset(10, 15))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.25,
                  height: size.height * 0.25,
                  child: InkWell(
                    onTap: _launchURL,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: AssetImage(course.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.45,
                  child: InkWell(
                    onTap: _launchURL,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: appPadding / 2, top: appPadding / 2.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: kBlueColor,
                              fontFamily: 'Montserrat',
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Row(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: _launchURL,
                                  child: Icon(
                                    Icons.label_important_outlined,
                                    color: kBlueColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                course.students,
                                style: TextStyle(
                                  color: black.withOpacity(0.5),
                                ),
                                maxLines: 2,
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: black.withOpacity(0.3),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                course.time.toString() + ' ' + 'min'.tr,
                                style: TextStyle(
                                  color: black.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 360, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'label'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: kBlueColor,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Lato',
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      const url =
                          'https://www.youtube.com/channel/UCFKE7WVJfvaHW5q283SxchA';
                      launchURL(url);
                    });
                  },
                  child: Text(
                    'view'.tr,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'subl'.tr,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lato',
                    color: kBlueColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: SizedBox(
                  height: 240,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return _buildCourses(context, index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              color: mi,
            ),
          ),
        ),
        Positioned(
          bottom: 45.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavOne(
                icon: Icons.device_hub_sharp,
                active: true,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavTwo(
                icon: Icons.donut_small_rounded,
                active: false,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavThree(
                icon: Icons.fiber_smart_record_rounded,
                active: false,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'nav1'.tr,
                style: TextStyle(
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'nav2'.tr,
                style: TextStyle(
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'nav3'.tr,
                style: TextStyle(
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavOne extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavOne({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (context, animation, animationTime, child) {
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.elasticOut);
                  return ScaleTransition(
                    alignment: Alignment.bottomLeft,
                    scale: animation,
                    child: child,
                  );
                },
                pageBuilder: (context, animation, animationTime) {
                  return Yoga();
                }));
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: my,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? kBlueColor : Colors.transparent,
          child: Icon(
            icon,
            color: active ? my : kBlueColor,
          ),
        ),
      ),
    );
  }
}

class NavTwo extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavTwo({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (context, animation, animationTime, child) {
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.elasticOut);
                  return ScaleTransition(
                    alignment: Alignment.bottomCenter,
                    scale: animation,
                    child: child,
                  );
                },
                pageBuilder: (context, animation, animationTime) {
                  return Open();
                }));
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: mi,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? kBlueColor : mi,
          child: Icon(
            icon,
            color: active ? my : kBlueColor,
          ),
        ),
      ),
    );
  }
}

class NavThree extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavThree({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (context, animation, animationTime, child) {
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.elasticOut);
                  return ScaleTransition(
                    alignment: Alignment.bottomRight,
                    scale: animation,
                    child: child,
                  );
                },
                pageBuilder: (context, animation, animationTime) {
                  return Sleep();
                }));
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: mi,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? kBlueColor : mi,
          child: Icon(
            icon,
            color: active ? my : kBlueColor,
          ),
        ),
      ),
    );
  }
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
