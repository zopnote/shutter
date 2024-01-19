import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/core/wrapper/network/services/mysql/Database.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/support/entrys.dart';

class AdminSupport extends StatefulWidget {
  const AdminSupport({super.key});

  @override
  State<AdminSupport> createState() => AdminSupportState();
}

class AdminSupportState extends State<AdminSupport> {
  void refresh() {
    setState(() {
      widgets = [];
      loaded = false;
    });
  }

  bool? loaded;
  List<Widget> widgets = [];

  Future<void> _load() async {
    if (!widgets.isEmpty) {
      setState(() {
        loaded = true;
      });
      return;
    }
    List<String> articleRequest =
        await Database.support().resources().unpublishedArticles();
    List<String> listInfoRequest =
        await Database.support().resources().unpublishedListInfos();
    List<String> supportRequest = await Database.support().listingUnanswered();
    if (articleRequest != []) {
      for (String value in articleRequest) {
        Article? article = await Database.article().get(value);
        if (article != null) {
          widgets.add(ASEntryArticle(article: article, address: value));
        }
      }
    }
    if (listInfoRequest != []) {
      for (String value in listInfoRequest) {
        ListInfo? listInfo = await Database.listInfo().get(value);
        if (listInfo != null) {
          widgets.add(ASEntryListInfo(listInfo: listInfo, address: value));
        }
      }
    }
    if (supportRequest != []) {
      for (String value in supportRequest) {
        Map<String, String?>? map = await Database.support().get(value);
        if (map != null) {
          widgets.add(ASEntrySupport(instance: this, map: map, address: value));
        }
      }
    }
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loaded ??= false;
    if (!loaded!) {
      return Scaffold(
        backgroundColor: Data.colorBackground,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Data.colorBackground,
          foregroundColor: Data.colorText,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Space(
              height: 190,
            ),
            Center(
                child: LottieBuilder.asset('assets/animations/loading.json')),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Data.colorBackground,
        foregroundColor: Data.colorText,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Data.colorBackground,
      body: ListView(
        children: widgets,
      ),
    );
  }
}
