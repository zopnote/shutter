import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/core/data/container/data.dart';

class WebManager {
  void open(String url, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InAppWebViewScreen(
          url: url,
        ),
      ),
    );
  }
}

class IntentManager {
  Future<void> open(String url) async {
    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: url,
    );
    await intent.launch();
  }
}

class InAppWebViewScreen extends StatefulWidget {
  final String url;

  InAppWebViewScreen({required this.url});

  @override
  _InAppWebViewScreenState createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Container(
                decoration: BoxDecoration(
                    color: Data.colorUnselected,
                    borderRadius: const BorderRadius.all(Radius.circular(80))),
                width: 300,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(80)))),
                    ),
                    onPressed: () {
                      IntentManager().open(widget.url);
                    },
                    child: Text(
                      'Klicke zum im Browser/App öffnen',
                      textScaleFactor: 1.10,
                      style: TextStyle(
                          color: Data.colorText, fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}

class IServ extends StatefulWidget {
  final String url;
  final bool fullscreen;

  IServ({required this.url, required this.fullscreen});

  @override
  _IServState createState() => _IServState();
}

class _IServState extends State<IServ> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: widget.fullscreen
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Data.colorSelected,
              child: const Align(
                alignment: Alignment(0, -0.2),
                child: Icon(TablerIcons.arrow_back, size: 35),
              ),
            )
          : null,
      floatingActionButtonLocation:
          widget.fullscreen ? FloatingActionButtonLocation.startFloat : null,
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
