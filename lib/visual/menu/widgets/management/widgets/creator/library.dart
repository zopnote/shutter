import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class CreatorLibraryHub extends StatefulWidget {
  @override
  State<CreatorLibraryHub> createState() => _CreatorLibraryHubState();
}

class _CreatorLibraryHubState extends State<CreatorLibraryHub> {
  static List<dynamic>? list;
  static List<Widget>? aList;

  Future<void> _load() async {
    list = await Database.creator().getArticles(Data.creatorID!);
    if (aList == null) {
      aList = [];
    }
    for (String string in list!) {
      Article? article = await Database.article().get(string);
      if (article != null) {
        aList!.add(Center(
          child: SizedBox(
            height: 200,
            child: article.toArticleCard(),
          ),
        ));
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    if (list == null) {
      if (mounted) {
        _load();
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    if (list != null) {
      list = null;
    }
    if (aList != null) {
      aList = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            backgroundColor: Data.colorBackground,
            foregroundColor: Data.colorText,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        backgroundColor: Data.colorBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'assets/animations/loading.json',
                height: 220,
                width: 220,
              ),
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
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: Data.colorBackground,
          foregroundColor: Data.colorText,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Mit deinem Account erstellte Artikel',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Data.colorText,
                  fontWeight: FontWeight.w500,
                  fontSize: 17)),
        ),
      ),
      backgroundColor: Data.colorBackground,
      body: ListView.builder(
        itemCount: aList!.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Space(
              height: 55,
            );
          }
          return aList!.reversed.elementAt(index);
        },
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
