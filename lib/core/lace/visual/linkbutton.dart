import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/linkmanager.dart';

class LinkButton extends StatelessWidget {
  final String url;
  final bool intent;
  final IconData icon;
  final Color colorIcon;

  const LinkButton({
    Key? key,
    required this.colorIcon,
    required this.icon,
    required this.url,
    required this.intent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 70,
              width: 70,
            ),
          ),
          Align(
            alignment: const Alignment(-0.8, -0.10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
                fixedSize: const MaterialStatePropertyAll(Size(70, 65)),
                surfaceTintColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                overlayColor: MaterialStatePropertyAll(Data.colorSelected),
              ),
              onPressed: () async {
                if (intent) {
                  IntentManager().open(url);
                } else {
                  WebManager().open(url, context);
                }
              },
              child: SizedBox(
                child: Center(
                  child: Icon(
                    icon,
                    color: colorIcon,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
