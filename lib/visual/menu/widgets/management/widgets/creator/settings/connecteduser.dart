import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/object/user/user.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';

class ConnectedUser extends StatefulWidget {
  @override
  State<ConnectedUser> createState() => _ConnectedUserState();
}

class _ConnectedUserState extends State<ConnectedUser> {
  List<dynamic>? user;
  List<Widget> widgets = [];
  bool loaded = false;

  Future<void> _load() async {
    user = await Database.creator().getUsers(Data.creatorID!);
    for (dynamic value in user!) {
      if (value == Data.user!.name) {
        widgets.add(
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
                    'Nutzer - ' + Data.user!.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Space(
                    height: 7,
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
                        '     ' + Data.user!.permissions.name,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        User? user = await Database.user().get(value);
        if (user != null) {
          String perm = user.permissions.name;
          widgets.add(
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
                      'Nutzer - ' + user.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Space(
                      height: 7,
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
                          '     ' + perm,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    }
    loaded = true;
    setState(() {});
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return SizedBox(
        child: Center(
          child: LottieBuilder.asset('assets/animations/loading.json'),
        ),
      );
    }
    return SizedBox(
      child: Column(
        children: widgets,
      ),
    );
  }
}
