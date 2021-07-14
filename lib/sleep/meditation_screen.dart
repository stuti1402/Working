/*
    this will include
    -breathe for given time
    -meditate for asked time ; timer, which notifies after the timer is up
    -meditate with tracks
 */

import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation/colorsfile.dart';
import 'package:flutter_meditation/sleep/globals.dart';
import 'package:flutter_meditation/sleep/meditation_animation_screen.dart';
import 'package:flutter_meditation/sleep/provider/meditation_provider.dart';
import 'package:flutter_meditation/sleep/settings_radioButtons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final audio = AssetsAudioPlayer();
  bool isDisposed = false;
  // bool isSelected = true;
  MeditationProvider provider;

  @override
  void dispose() {
    if (isDisposed) {
      audio.dispose();
      provider.sngTimer.cancel();
      print('dispose : $isDisposed');
      isDisposed = true;
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of(context, listen: false);
  }

  Future<bool> songExist() {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            backgroundColor: o2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            title: Text(
              'setting'.tr,
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kActiveIconColor,
                  ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'cancel'.tr,
                  style: Theme.of(context).textTheme.overline.copyWith(
                        color: kActiveIconColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Global.screenWidth * 0.035,
                      ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'okay'.tr,
                  style: Theme.of(context).textTheme.overline.copyWith(
                        color: kActiveIconColor,
                        fontSize: Global.screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Global().init(
        context); // This is self defined class which help us to pass MediaQuery ScreenSize

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: size.height * .30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/AB.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(290, 1, 5, 0),
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          openSettings(context);
                        },
                        child: Icon(
                          Icons.settings,
                          size: 25,
                          color: sl,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: sl,
                          ),
                          TyperAnimatedTextKit(
                            isRepeatingAnimation: true,
                            speed: Duration(milliseconds: 50),
                            textStyle: GoogleFonts.montserrat(
                                fontSize: 22,
                                color: sl,
                                fontWeight: FontWeight.w600),
                            text: [
                              "t1".tr,
                              "t2".tr,
                              "t3".tr,
                              "t4".tr,
                              "t5".tr,
                              "t6".tr,
                              "t7".tr,
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: SizedBox(
                        width: size.width * .8,
                        child: Text(
                          "subt".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: sleep,
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 180, left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(10),
                childAspectRatio: 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  myGridItems(
                    "gr1".tr,
                    "1.",
                    "https://www.mcislanguages.com/website/wp-content/uploads/iStock-1161561165.jpg",
                    kTextColor,
                    o3,
                  ),
                  myGridItems(
                    "gr2".tr,
                    "2.",
                    "https://media.istockphoto.com/vectors/breathing-exersice-vector-id1126240522?k=6&m=1126240522&s=612x612&w=0&h=v458UuBiFBJPFMgLuhkrieJVsSEP-v1qMy0WKtuv40Y=",
                    kTextColor,
                    o3,
                  ),
                  myGridItems(
                    "gr3".tr,
                    "3.",
                    "https://www.royalcornwall.nhs.uk/wp-content/uploads/2020/07/mindfulness.png",
                    kTextColor,
                    o3,
                  ),
                  myGridItems(
                    "gr4".tr,
                    "4.",
                    "https://njmonthly.com/wp-content/uploads/cache/2017/01/hbarczyk_njmonthly_finalart2/3099178910.jpg",
                    kTextColor,
                    o3,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 440,
                ),
                child: Ink(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(68.0),
                    ),
                    color: kActiveIconColor,
                    onPressed: meditateProcesses,
                    padding: EdgeInsets.fromLTRB(65, 15, 65, 15),
                    child: Text(
                      "med".tr,
                      style: TextStyle(
                        color: o1,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openSettings(BuildContext ctx) {
    Navigator.of(ctx).push(
      CupertinoPageRoute(
        builder: (context) => SettingsPage(),
      ),
    );
  }

  void meditateProcesses() {
    MeditationProvider provider = Provider.of(context, listen: false);
    if (provider.isSongSelected) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => MedationAnimationScreen(),
        ),
      );
      //print('Playing: ${provider.isplaying}');
      setState(() {
        provider.isplaying == false ? provider.play() : provider.opensong();

        isDisposed = true;
      });
    } else {
      songExist(); // Alert Dialog
    }
    provider.meditaionsPressed = true;
  }

  Widget myGridItems(String gridName, String gridNo, String gridimage,
      var color1, var color2) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: new LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.4,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: new NetworkImage(gridimage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        gridNo,
                        style: TextStyle(
                            color: white,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  gridName,
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.85,
        curveEndPoint.dx - 60, curveEndPoint.dy + 10);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.99,
        curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Global().init(context);
    return Stack(
      children: [
        Container(
          height: Global.screenHeight,
          width: Global.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/setting.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              iconSize: 30,
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: kActiveIconColor,
                    fontSize: Global.screenWidth * 0.07,
                    fontFamily: 'Montserrat',
                  ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Meditation Type'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white70,
                              fontSize: Global.screenWidth * 0.032,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.white70,
                ),
                SettingRadioButtons(
                  height: Global.screenHeight * 0.8,
                  width: Global.screenWidth * 0.8,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
