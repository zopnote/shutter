import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/lace/visual/rowplaceholder.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';
import 'package:shutter/core/wrapper/network/services/youtube/client.dart';

class Status extends StatefulWidget {
  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  bool loaded = false;
  static int? databasePoolUsage;
  static bool? ytOnline;
  int? support;

  @override
  void initState() {
    super.initState();
    if (!loaded) {
      load();
    }
  }

  Future<void> load() async {
    ytOnline ??= await YouTube.isOnline();
    databasePoolUsage ??= await Database.getDatabaseUsage();
    List<String> articleRequest =
        await Database.support().resources().unpublishedArticles();
    List<String> listInfoRequest =
        await Database.support().resources().unpublishedListInfos();
    List<String> supportRequest = await Database.support().listingUnanswered();
    support =
        articleRequest.length + listInfoRequest.length + supportRequest.length;
    loaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return SizedBox(
        width: 320,
        height: 410,
        child: Center(
          child: LottieBuilder.asset('assets/animations/loading.json'),
        ),
      );
    }
    return SizedBox(
      width: 320,
      height: 410,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 40,
                    color: Color(0xFF1F1F1F),
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('Status',
                    textScaleFactor: 3.0,
                    style: TextStyle(
                        color: Color(0xFF1F1F1F), fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            RowPlaceholder(
                placeholder: 'Last der Datenbank',
                variable: '${databasePoolUsage}MB'),
            Space(height: 20),
            RowPlaceholder(
                placeholder: 'Status der API',
                variable: ytOnline! ? 'Online' : 'Offline'),
            Space(height: 20),
            RowPlaceholder(
                placeholder: 'Supportanfragen', variable: support.toString()),
          ],
        ),
      ),
    );
  }
}
