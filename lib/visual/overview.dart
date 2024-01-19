import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/cantinecard/cantinecard.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/cantinecard/cantinecardcontainer.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/cantinecard/cantinecardloader.dart';
import 'package:shutter/visual/overview/widgets/eventarticle.dart';
import 'package:shutter/visual/overview/widgets/pricebutton.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:vibration/vibration.dart';

class Overview extends StatefulWidget {
  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with TickerProviderStateMixin {
  late TabController _tabController;
  static bool loaded = false;
  static CantineCard? cantineCard;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  Widget _object() {
    if (!loaded) {
      if (Data.activeAnimations) {
        return Column(
          children: [
            LottieBuilder.asset(
              'assets/animations/loading.json',
              height: 120,
              width: 120,
            ),
            Space(
              height: 50,
            ),
          ],
        );
      }
      return Center(
        child: Column(
          children: [
            Space(
              height: 15,
            ),
            Text('Lade Daten...',
                style: TextStyle(
                    color: Data.colorText,
                    fontWeight: FontWeight.w500,
                    fontSize: 23)),
          ],
        ),
      );
    }
    return Center(
      child: Container(
        height: 400,
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: cantineCard!.toList(context).map((item) {
            return item;
          }).toList(),
        ),
      ),
    );
  }

  Future<void> load() async {
    if (CantineCardContainer.cantineCard == null) {
      await CantineCardLoader.execute();
      loaded = true;
      cantineCard = CantineCardContainer.cantineCard;
      if (mounted) {
        setState(() {});
      }
      return;
    }
    loaded = true;
    cantineCard = CantineCardContainer.cantineCard;
    if (mounted) {
      setState(() {});
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    if (cantineCard == null && loaded) {
      loaded = false;
    }
    if (loaded) {
      _tabController = TabController(
          length: cantineCard!.toList(context).length, vsync: this);
    } else {
      _tabController = TabController(length: 0, vsync: this);
    }
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: Center(
        // TODO: change to ListView.builder();
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  loaded ? cantineCard!.date : 'Lade...',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Data.colorText,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Mensakarte',
                  textScaleFactor: 2.6,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Data.colorText,
                  ),
                ),
                (Data.activeAnimations
                    ? LottieBuilder.asset('assets/animations/cafecard.json',
                        height: 45, width: 45, repeat: false)
                    : SizedBox()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                onTap: (value) {
                  if (Data.activeVibration) {
                    Vibration.vibrate(duration: 50);
                  }
                },
                controller: _tabController,
                isScrollable: true,
                physics: const BouncingScrollPhysics(),
                indicator: DotIndicator(
                    color: Data.colorText, distanceFromCenter: 10, radius: 4),
                tabs: [
                  Text(
                    'Montag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Dienstag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Mittwoch\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Donerstag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Freitag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
            ),
            _object(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Preise ',
                  textScaleFactor: 2.6,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Data.colorText,
                  ),
                ),
                (Data.activeAnimations
                    ? LottieBuilder.asset('assets/animations/arrow_down.json',
                        height: 45, width: 45, repeat: true)
                    : SizedBox()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            PriceButton(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Ereignisse',
                  textScaleFactor: 2.6,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Data.colorText,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PageEventArticle(),
          ],
        ),
      ),
    );
  }
}
