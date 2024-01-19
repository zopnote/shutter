import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';

class InfoPageDisco extends StatelessWidget {
  const InfoPageDisco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Data.colorBackground,
        foregroundColor: Data.colorText,
      ),
      backgroundColor: Data.colorBackground,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Data.colorBackground,
                    width: 5,
                  )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Data.colorBackground,
                    width: 5,
                  )),
              child: Image.network(
                'http://igs-delmenhorst.de/wp-content/uploads/2019/02/DJI_0042.jpg',
                fit: BoxFit.fitWidth,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  );
                },
              ),
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Die Schülerdisco der Integrierten Gesamtschule Delmenhorst',
              textScaleFactor: 1.9,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Data.colorText),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              child: Text(
                'Seit 1995 gibt es die Freitagsdisco \nin der Pausenhalle.'
                ' Wir sind als Schule mit \ndiesem Angebot einzigartig. '
                'Das gesamte Discoteam freut sich jedes mal aufs \n'
                'neue dies weiterzuführen.\n\n'
                ''
                'Auf die Idee kam unsere Sozialpädagogin Britta.\n'
                'Jeden Freitag einmal Schuldisco um das Wochenende einzuleiten.\n\n'
                ''
                ''
                'Das Aufbauen geht mittlerweile ziemlich schnell. '
                'Wobei unser technisches Equipment durchschnittlich ist.'
                'Wir habe die Anlagen/Boxen,\n ein Mischpult, '
                'ein Licht und noch etwas Kleinkram.\n\n'
                ''
                'Doch jedesmal nach dem Aufbau \nfreuen wir uns sehr, '
                'das die Disco so beliebt ist.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Data.colorText),
                textScaleFactor: 1.3,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Data.colorBackground,
                  width: 5,
                )),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Data.colorBackground,
                  width: 5,
                )),
            child: Image.network(
              'http://igs-delmenhorst.de/wp-content/uploads/2018/12/DJI_0063.jpg',
              fit: BoxFit.fitWidth,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageRules extends StatelessWidget {
  const InfoPageRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Data.colorBackground,
        foregroundColor: Data.colorText,
      ),
      backgroundColor: Data.colorBackground,
      body: ListView(
        children: [
          const SizedBox(
            height: 45,
          ),
          Center(
            child: Text(
              'Regeln für das\nEinreichen von Songs',
              textScaleFactor: 1.9,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Data.colorText),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              child: Text(
                'Eingereichte Songs werden unter bestimmten \nVoraussetzungen aussortiert. Hier erfährst du welche \ndas sind. Hier ist eine Auflistung:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Data.colorText, fontWeight: FontWeight.w500),
                textScaleFactor: 1.0,
              ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Center(
            child: SizedBox(
              child: Text(
                '\n• Songs mit vielen Beleidigungen.\n• Songs mit angreifendem Inhalt.\n\n• Songs des Genre Punk-Rock.\n• Songs mit politischem Fokus.\n\n• Animeintros.\n• Songs von verurteilten Künstlern.\n• Der Song Şemmame.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Data.colorText, wordSpacing: 5),
                textScaleFactor: 1.49,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: SizedBox(
              child: Text(
                'Legal action will be taken against unlawful use of the \nAPI key. '
                'Unlawful use includes everything that is \nprohibited by the Google terms, '
                'as well as \nanything prohibited by the Youtube terms. In addition, \nall use of this key outside of this application or without my consent.\nby @Zopnote',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Data.colorText, fontWeight: FontWeight.w100),
                textScaleFactor: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
