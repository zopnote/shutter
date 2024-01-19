import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/shutter.dart';

class ArticlePolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 220,
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/branding.jpg').image)),
              ),
              Text('DSGVO-A v${Shutter.dsgvoVersion}.${Shutter.appVersion}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  textScaleFactor: 1.3),
            ],
          ),
          Container(
            color: Data.colorText,
            width: 350,
            height: 2,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Sammeln personenbezogender Daten beim erstellen von öffentlich zugänglichen Inhalten',
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Sofern ein Nutzer die nötigen Berechtigungen erhält, kann er Inhalte für eine Gruppe oder sämtliche Nutzer der App erstellen. Dabei werden Daten die hochgeladen werden gespeichert. Dazu zählen Bilder, Links, Audiodateien & Textinhalte. Eine Löschung dieser, eines Inhalts, kann nur manuell in der Application ausgeführt werden',
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Data.colorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
