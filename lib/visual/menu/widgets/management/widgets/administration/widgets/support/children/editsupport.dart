import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/seesupport.dart';

class ESD extends StatelessWidget {
  String address;
  AdminSupportState instance;

  ESD({
    required this.instance,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space(
            height: 15,
          ),
          const Center(
            child: Text(
              'Bist du dir sicher?',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Space(
            height: 15,
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
                  Database.support().remove(address);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ShutterDialog.show(
                      context, 'Supportanfrage wurde erfolgreich gelöscht.');
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const AdminSupport(),
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
                child: const Text(
                  'Ja, lösche die Supportanfrage',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class ESE extends StatefulWidget {
  AdminSupportState instance;
  String address;
  Map<String, String?> map;

  ESE({
    required this.instance,
    required this.address,
    required this.map,
  });

  @override
  State<ESE> createState() => _ESEState();
}

class _ESEState extends State<ESE> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 560,
      width: 400,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Space(
            height: 15,
          ),
          Center(
            child: Text(
              'An ${widget.map['user']!}',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: const TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Space(
            height: 15,
          ),
          Center(
            child: SizedBox(
              width: 250,
              child: TextField(
                onChanged: (s) {
                  setState(() {});
                },
                maxLength: 400,
                maxLines: 30,
                minLines: 1,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: textEditingController,
                textAlignVertical: const TextAlignVertical(y: -0.65),
                style: const TextStyle(color: Color(0xFF414141), fontSize: 16),
                textAlign: TextAlign.start,
                cursorColor: const Color(0xFF414141),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF414141), width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7F7CD2), width: 2),
                  ),
                  hoverColor: Color(0xFF414141),
                  labelText: ' Antwort',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414141),
                    backgroundColor: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
          Space(
            height: 10,
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
                  Database.support().answer(widget.address,
                      textEditingController.text, Data.user!.name);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const AdminSupport(),
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                  ShutterDialog.show(context,
                      'Deine Antwort wurde an den Nutzer geschickt und die Anfrage ist nun bearbeitet und archiviert.');
                },
                child: const Text(
                  'Absenden',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
