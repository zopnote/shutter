import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/displaylocation.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/seesupport.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/support/children/editsupport.dart';

class ASEntryArticle extends StatelessWidget {
  Article article;
  String address;

  ASEntryArticle({
    super.key,
    required this.article,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 330,
          decoration: const BoxDecoration(
            color: Color(0xFFE3E3E3),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Data.colorSelected,
                child: const Align(
                  alignment: Alignment(0, -0.1),
                  child: Icon(
                    TablerIcons.news,
                    size: 30,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 194,
                child: Text(
                  article.content.title,
                  textScaleFactor: 1.15,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF414141),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ASED(
                        address: address,
                        article: article,
                      );
                    },
                  ));
                },
                child: Container(
                  width: 63,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Data.colorSelected,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Icon(
                    TablerIcons.notebook,
                    size: 27,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ASED extends StatelessWidget {
  Article article;
  String address;

  ASED({
    super.key,
    required this.article,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
            child: article.toArticleCard(),
            height: 240,
            width: 400,
          )),
          Space(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shadowColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(0.0001),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AdminSupport(),
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                      ShutterDialog.show(context, 'Artikel wurde gelöscht.');
                      await Database.article().delete(address);
                    },
                    child: const Text(
                      'Löschen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Space(
                width: 10,
              ),
              Center(
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shadowColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(0.0001),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AdminSupport(),
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                      ShutterDialog.show(
                          context, 'Artikel wurde veröffentlicht.');
                      await Database.article().delete(address);
                      await Database.article()
                          .insert(DisplayLocation.Project, article);
                      await Database.support()
                          .resources()
                          .publishArticle(address);
                    },
                    child: const Text(
                      'Als Projekt veröf.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
          Space(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shadowColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(0.0001),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AdminSupport(),
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                      ShutterDialog.show(
                          context, 'Artikel wurde veröffentlicht.');
                      await Database.article().delete(address);
                      await Database.article()
                          .insert(DisplayLocation.Event, article);
                      await Database.support()
                          .resources()
                          .publishArticle(address);
                    },
                    child: const Text(
                      'Als Event veröf.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Space(
                width: 10,
              ),
              Center(
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shadowColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(0.0001),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AdminSupport(),
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                      ShutterDialog.show(
                          context, 'Artikel wurde veröffentlicht.');
                      await Database.article().delete(address);
                      await Database.article()
                          .insert(DisplayLocation.Spotlight, article);
                      await Database.support()
                          .resources()
                          .publishArticle(address);
                    },
                    child: const Text(
                      'Als Spotlight veröf.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ASEntryListInfo extends StatelessWidget {
  ListInfo listInfo;
  String address;
  bool pressed = false;
  bool deleted = false;

  ASEntryListInfo({
    super.key,
    required this.listInfo,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 330,
          decoration: const BoxDecoration(
            color: Color(0xFFE3E3E3),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: listInfo.color,
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  child: Icon(
                    listInfo.icon,
                    size: 30,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              const SizedBox(
                width: 194,
                child: Text(
                  'Informationsnachricht',
                  textScaleFactor: 1.15,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF414141),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ShutterDialog.showObject(
                      context,
                      SizedBox(
                        width: 400,
                        height: 170,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 400,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ListInfo(
                                          color: listInfo.color,
                                          icon: listInfo.icon,
                                          title: listInfo.title,
                                          description: listInfo.description)
                                      .createEntry(),
                                ],
                              ),
                            ),
                            Space(
                              height: 10,
                            ),
                            Text(
                              'Von ${listInfo.creatorID}',
                              textScaleFactor: 1.15,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF414141),
                              ),
                            ),
                            Space(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.black),
                                        elevation:
                                            MaterialStatePropertyAll(0.0001),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (pressed) {
                                          ShutterDialog.show(context,
                                              'Informationsnachricht wurde bereits veröffentlicht.');
                                          return;
                                        }
                                        await Database.support()
                                            .resources()
                                            .publishInfo(address);
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const AdminSupport(),
                                            transitionDuration:
                                                const Duration(milliseconds: 200),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ),
                                        );
                                        ShutterDialog.show(context,
                                            'Informationsnachricht wurde veröffentlicht.');
                                      },
                                      child: const Text(
                                        'Veröffentlichen',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ),
                                Space(
                                  width: 10,
                                ),
                                Center(
                                  child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.black),
                                        elevation:
                                            MaterialStatePropertyAll(0.0001),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (deleted) {
                                          ShutterDialog.show(context,
                                              'Informationsnachricht wurde bereits gelöscht.');
                                          return;
                                        }
                                        await Database.listInfo()
                                            .delete(address);
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const AdminSupport(),
                                            transitionDuration:
                                                const Duration(milliseconds: 200),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ),
                                        );
                                        ShutterDialog.show(context,
                                            'Informationsnachricht wurde gelöscht.');
                                      },
                                      child: const Text(
                                        'Löschen',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
                child: Container(
                  width: 63,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Data.colorSelected,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Icon(
                    TablerIcons.notebook,
                    size: 27,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ASEntrySupport extends StatefulWidget {
  AdminSupportState instance;
  Map<String, String?> map;
  String address;

  ASEntrySupport({
    super.key,
    required this.instance,
    required this.map,
    required this.address,
  });

  @override
  State<ASEntrySupport> createState() => _ASEntrySupportState();
}

class _ASEntrySupportState extends State<ASEntrySupport> {
  @override
  Widget build(BuildContext context) {
    String title = '';
    if (widget.map['message']!.length > 25) {
      title = '${widget.map['message']!.substring(0, 23)}...';
    } else {
      title = widget.map['message']!;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 330,
          decoration: const BoxDecoration(
            color: Color(0xFFE3E3E3),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Data.colorSelected,
                child: const Align(
                  alignment: Alignment(0, -0.1),
                  child: Icon(
                    TablerIcons.user_question,
                    size: 30,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 194,
                child: Text(
                  title,
                  textScaleFactor: 1.15,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF414141),
                  ),
                ),
              ),
              GestureDetector(
                //------------------------------------------------------------------------------------------------------------------------------------------------------------------
                //------------------------------------------------------------------------------------------------------------------------------------------------------------------
                onTap: () {
                  ShutterDialog.showObject(
                      context,
                      SizedBox(
                        height: 450,
                        width: 400,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Space(
                              height: 10,
                            ),
                            Text(title,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                    color: Data.colorText,
                                    fontWeight: FontWeight.w500)),
                            Text('von ' + widget.map['user']!,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                    color: Data.colorText,
                                    fontWeight: FontWeight.w500)),
                            Space(
                              height: 30,
                            ),
                            Text(widget.map['message']!,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    color: Data.colorText,
                                    fontWeight: FontWeight.w400)),
                            Space(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.black),
                                        elevation:
                                            MaterialStatePropertyAll(0.0001),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        ShutterDialog.showObject(
                                          context,
                                          ESD(
                                            instance: widget.instance,
                                            address: widget.address,
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Löschen',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ),
                                Space(
                                  width: 10,
                                ),
                                Center(
                                  child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black),
                                        shadowColor: MaterialStatePropertyAll(
                                            Colors.black),
                                        elevation:
                                            MaterialStatePropertyAll(0.0001),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                        ),
                                      ),

                                      //----------------------------------------------------------------------------Beantworten-----------------------------------------------------------------------
                                      //------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                      onPressed: () {
                                        ShutterDialog.showObject(
                                          context,
                                          ESE(
                                            instance: widget.instance,
                                            address: widget.address,
                                            map: widget.map,
                                          ),
                                        );
                                      },
                                      //-----------------------------------------------------------------------------Beantworten--------------------------------------------------------------------------
                                      //------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                      child: const Text(
                                        'Beantworten',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },

                //------------------------------------------------------------------------------------------------------------------------------------------------------------------
                //------------------------------------------------------------------------------------------------------------------------------------------------------------------
                child: Container(
                  width: 63,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Data.colorSelected,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Icon(
                    TablerIcons.mail,
                    size: 27,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
