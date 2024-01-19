import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/visual/prises/widgets/cafeteria.dart';
import 'package:shutter/visual/prises/widgets/kiosk.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Prises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Data.colorBackground,
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Data.colorBackground,
                  centerTitle: true,
                  bottom: TabBar(
                      enableFeedback: true,
                      splashFactory: NoSplash.splashFactory,
                      isScrollable: true,
                      indicator: DotIndicator(
                          color: Data.colorSelected, distanceFromCenter: 35),
                      unselectedLabelColor: Data.colorUnselected,
                      indicatorColor: Data.colorSelected,
                      labelColor: Data.colorSelected,
                      padding: const EdgeInsets.all(20),
                      tabs: const [
                        Tab(icon: Icon(Ionicons.storefront), text: '  Kiosk  '),
                        Tab(icon: Icon(Ionicons.cafe), text: 'Caféteria'),
                      ]),
                ),
              ];
            },
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                Kiosk(),
                Cafeteria(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createEntry(double prise, String name) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.08, -0.4),
              child: Text(
                '${prise}0 €',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Data.colorText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.4),
              child: Text(
                name,
                textScaleFactor: 1.2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Data.colorText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
