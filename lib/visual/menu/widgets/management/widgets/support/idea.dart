import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:uuid/uuid.dart';

class Idea extends StatefulWidget {
  @override
  State<Idea> createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  TextEditingController? textEditingController;

  @override
  void dispose() {
    textEditingController = null;
    super.dispose();
  }

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Eine Idee erzählen',
            textAlign: TextAlign.center,
            textScaleFactor: 1.3,
            style: TextStyle(
              color: Color(0xFF2A2A2A),
              fontWeight: FontWeight.bold,
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
                maxLength: 300,
                maxLines: 50,
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
                  labelText: ' Nachricht',
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
          ElevatedButton(
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
                try {
                  if (textEditingController!.text.length > 29) {
                    Navigator.pop(context);
                    final uuid = Uuid();
                    final generatedUuid = uuid.v4();
                    final now = DateTime.now();
                    final dateFormatter = DateFormat('yyyy-MM-dd');
                    final timeFormatter = DateFormat('HH:mm:ss');
                    final currentDate = dateFormatter.format(now);
                    final currentTime = timeFormatter.format(now);
                    ShutterDialog.show(context,
                        'Danke fürs Absenden. Sobald die Anfrage beantwortet wurde, wird dir die Antwort beim start der App angezeigt.');
                    await Database.support().quest(
                        generatedUuid,
                        'Idea request, $currentDate at $currentTime. Message: ${textEditingController!.text}',
                        Data.user!.name);
                  } else {
                    ShutterDialog.show(
                        context, 'Gebe mindestens 30 Zeichen an.');
                  }
                } catch (e) {
                  ShutterDialog.show(context, 'Fehler, öffne die Seite neu.');
                }
              },
              child: const Text(
                'Absenden',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
