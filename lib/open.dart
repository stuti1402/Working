import 'package:flutter/material.dart';
import 'package:flutter_meditation/deatil.dart';
import 'package:flutter_meditation/sidebar.dart';
import 'package:flutter_meditation/sleep/sleep.dart';
import 'package:flutter_meditation/yoga/yoga.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Open extends StatefulWidget {
  @override
  _OpenState createState() => _OpenState();
}

class _OpenState extends State<Open> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Stack(
              children: [
                CustomBody(),
                CustomAppbar(),
                NavBar(),
                SideBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  final locales = [
    {'name': '🇺🇸     English', 'locale': Locale('en', 'US')},
    {'name': '🇮🇳     हिंदी', 'locale': Locale('hi', 'IN')}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 105.0,
        child: Stack(
          children: [
            ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.purple.shade50,
              ),
            ),
            Positioned(
              top: 30.0,
              left: MediaQuery.of(context).size.width / 2 - 25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.grey.shade100,
                  ),
                  CircleAvatar(
                    radius: 23.0,
                    backgroundImage: AssetImage("assets/applogoo.png"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'title'.tr,
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.translate,
                      color: Colors.purple,
                    ),
                    onPressed: () => showLocaleDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLocaleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        title: Text(
          'lang'.tr,
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              child: Padding(
                child: Text(
                  locales[index]['name'],
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              onTap: () => updateLocale(
                locales[index]['locale'],
                context,
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
            itemCount: 2,
          ),
        ),
      ),
    );
  }

  updateLocale(Locale locale, BuildContext context) {
    Navigator.of(context).pop();
    Get.updateLocale(locale);
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Section(
              headline: 'head1'.tr,
              description: 'desc1'.tr,
              img: AssetImage("assets/98.jpg"),
            ),
            Section(
              headline: 'head3'.tr,
              description: 'desc3'.tr,
              img: AssetImage('assets/ks.png'),
            ),
          ],
        ),
        Center(
          child: ClipPath(
            clipper: MidClipper(),
            child: Section(
              headline: 'head2'.tr,
              description: 'desc2'.tr,
              img: AssetImage('assets/13.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String headline;
  final String description;
  final ImageProvider img;

  const Section({
    Key key,
    this.headline,
    this.description,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: img,
          ),
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: headline,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '\n$description',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
              color: Colors.purple.shade50,
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
                active: false,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavTwo(
                icon: Icons.donut_small_rounded,
                active: true,
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
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'nav2'.tr,
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'nav3'.tr,
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
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
              }),
        );
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.purple,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.transparent : Colors.purple.shade50,
          child: Icon(
            icon,
            color: active ? Colors.purple.shade50 : Colors.purple,
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
              }),
        );
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.purple,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.transparent : Colors.purple.shade50,
          child: Icon(
            icon,
            color: active ? Colors.purple.shade50 : Colors.purple,
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
        backgroundColor: Colors.purple,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.transparent : Colors.purple.shade50,
          child: Icon(
            icon,
            color: active ? Colors.purple.shade50 : Colors.purple,
          ),
        ),
      ),
    );
  }
}

class MidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(0, sh * .3, sw, sh * .2, sw, sh * .45);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * .7, 0, sh * .8, 0, sh * .55);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
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

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(0, sh);
    path.lineTo(4 * sw / 12, sh);
    path.cubicTo(5 * sw / 12, sh, 5 * sw / 12, sh / 2, 6 * sw / 12, sh / 2);
    path.cubicTo(7 * sw / 12, sh / 2, 7 * sw / 12, sh, 8 * sw / 12, sh);
    path.lineTo(sw, sh);
    path.lineTo(sw, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
