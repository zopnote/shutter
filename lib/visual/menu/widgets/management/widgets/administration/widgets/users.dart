import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle.dart';

import '../../../../../../../core/object/user/user.dart';

class UserAdmin extends StatefulWidget {
  @override
  State<UserAdmin> createState() => _UserAdminState();
}

class _UserAdminState extends State<UserAdmin> {
  bool loaded = false;
  List<Widget> creator = [];
  List<Widget> user = [];

  Future<void> _load() async {
    List<String> loadedCreator = await Database.creator().listing();
    List<String> loadedUser = await Database.user().listing();
    for (String value in loadedCreator) {
      creator.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE3E3E3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            height: 90,
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Space(
                  height: 7,
                ),
                Text(
                  'CreatorID - ' + value,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Space(
                  height: 7,
                ),
                GestureDetector(
                  onDoubleTap: () async {
                    await Database.creator().delete(value);
                    setState(() {
                      loaded = false;
                    });
                  },
                  child: Row(
                    children: [
                      Space(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Data.colorSelected,
                        child: const Align(
                          alignment: Alignment(0, -0.1),
                          child: Icon(
                            TablerIcons.trash,
                            size: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const Text(
                        '    Löschen (Doppelt tippen)',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      setState(() {
        loaded = true;
      });
    }
    for (String value in loadedUser) {
      User? userGet = await Database.user().get(value);
      if (userGet != null) {
        user.add(
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE3E3E3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              height: 170,
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Space(
                    height: 7,
                  ),
                  Text(
                    'Nutzer - ' + userGet.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Space(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Space(
                        width: 60,
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Data.colorSelected,
                        child: const Align(
                          alignment: Alignment(0, -0.1),
                          child: Icon(
                            TablerIcons.user_code,
                            size: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Text(
                        '     ' + userGet.permissions.name,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Space(
                    height: 10,
                  ),
                  GestureDetector(
                    onDoubleTap: () async {
                      await Database.user().remove(userGet.name);
                      setState(() {
                        loaded = false;
                      });
                    },
                    child: Row(
                      children: [
                        Space(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Data.colorSelected,
                          child: const Align(
                            alignment: Alignment(0, -0.1),
                            child: Icon(
                              TablerIcons.trash,
                              size: 20,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        const Text(
                          '    Löschen (Doppelt tippen)',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      setState(() {
        loaded = true;
      });
    }
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
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
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Container(
              height: 100,
              width: 360,
              decoration: const BoxDecoration(
                color: Color(0xFFE3E3E3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: const Center(
                child: Text(
                  'Nutzer & Creator',
                  textScaleFactor: 2.0,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414141),
                  ),
                ),
              ),
            ),
          ),
          Space(
            height: 20,
          ),
          EntryDA(
            title: 'Creator',
            child: Column(
              children: creator,
            ),
          ),
          Space(
            height: 20,
          ),
          EntryDA(
            title: 'Nutzer',
            child: Column(
              children: user,
            ),
          ),
          Space(
            height: 20,
          ),
        ],
      ),
    );
  }
}
