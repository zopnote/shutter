import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';

class UrlPicker {
  final BuildContext context;

  UrlPicker({required this.context});

  Future<Map<String, String>?> pick() async {
    Completer<Map<String, String>?> completer =
        Completer<Map<String, String>?>();

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyCustomWidget(),
      ),
    );

    completer.complete(result);

    return completer.future;
  }
}

class MyCustomWidget extends StatefulWidget {
  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  late TextEditingController controller;
  late TextEditingController controller2;

  @override
  void initState() {
    controller = TextEditingController();
    controller2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Space(
            height: 90,
          ),
          LottieBuilder.asset(
            'assets/animations/article_addition.json',
            repeat: false,
          ),
          Space(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 360,
              child: TextField(
                onChanged: (s) {
                  setState(() {});
                },
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: controller2,
                textAlignVertical: const TextAlignVertical(y: -0.65),
                maxLength: 17,
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
                  labelText: ' Gebe einen Namen ein.',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414141),
                    backgroundColor: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 360,
              child: TextField(
                onChanged: (s) {
                  setState(() {});
                },
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: controller,
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
                  labelText: ' Gebe eine Url ein.',
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
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Map<String, String> result = {
                  controller2.text: controller.text,
                };
                Navigator.of(context).pop(result);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      child: Icon(
                        Ionicons.checkmark,
                        color: Data.colorBackground,
                        size: 23,
                      ),
                      decoration: BoxDecoration(
                          color: Data.colorSelected,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  Text(
                    '  Speichern & Hinzufügen',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF414141),
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                  )
                ],
              ),
            ),
          ),
          Space(
            height: 60,
          ),
        ],
      ),
    );
  }
}
