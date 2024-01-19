import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/main.dart';
import 'package:shutter/visual/home/widgets/user_cog.dart';
import 'package:vibration/vibration.dart';

class Followed extends StatefulWidget {
  @override
  State<Followed> createState() => _FollowedState();
}

class _FollowedState extends State<Followed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leadingWidth: 70,
              leading: IconButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  TablerIcons.user_cog,
                  size: 34,
                  color: Data.colorBackground,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => UserCog(),
                      transitionDuration: const Duration(milliseconds: 30),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                  if (Data.activeVibration) {
                    Vibration.vibrate(duration: 50);
                  }
                },
              ),
              actions: <Widget>[
                IconButton(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 32,
                    color: Data.colorBackground,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const PageLogic(),
                        transitionDuration: const Duration(milliseconds: 30),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                    if (Data.activeVibration) {
                      Vibration.vibrate(duration: 50);
                    }
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
              backgroundColor: Data.colorSelected,
              expandedHeight: 150,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(0, 0.8),
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                              Data.user!.name,
                              style: TextStyle(
                                color: Data.colorBackground,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              Data.user!.permissions.name,
                              style: TextStyle(
                                color: Data.colorBackground,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 0.7,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 10),
              LottieBuilder.asset(
                'assets/animations/in_development.json',
              ),
              Text(
                'Dieses Feature ist noch in Entwicklung...',
                style: TextStyle(
                    color: Data.colorText, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowedEntry extends StatelessWidget {
  final ImageProvider<Object> image;
  final String creatorID;
  final String creatorDescription;

  FollowedEntry(
      {required this.image,
      required this.creatorID,
      required this.creatorDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          CircleAvatar(
            radius: 29,
            backgroundColor: Color(0xFFFFFFFF),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(image: image, fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                creatorID,
                textScaleFactor: 1.7,
                style: const TextStyle(
                    color: Color(0xFF414141), fontWeight: FontWeight.bold),
              ),
              Text(
                creatorDescription,
                textScaleFactor: 1.3,
                style: const TextStyle(
                  color: Color(0xFF414141),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 11,
          ),
        ],
      ),
    );
  }
}
