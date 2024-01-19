import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/linkmanager.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/shutter.dart';
import 'package:shutter/visual/startup/articlepolicy.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        backgroundColor: const Color(0xFFFFFFFF),
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
                Text('DSGVO v${Shutter.dsgvoVersion}.${Shutter.appVersion}',
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
                'Name und Kontaktdaten des Verantwortlichen',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Für Rückfragen bezüglich des Datenschutzes, kann der Entwickler Lenny Siebert (über die Mail lennysiebert08@gmail.com) oder die zuständige Arbeitsgemeinschaft über shutter.dev.sup@gmail.com erreicht werden. Weitere frage sollten an (____) den zuständigen Datenschutzbeauftragten über seine Mailadresse (____) gehen.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Zweck der Datensammlung',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Um unseren Dienst bereitzustellen, benötigen wir Nutzerbezogende Daten für die Speicherung der Nutzung und des Verlaufes sowie für die Zuweisung von Verwaltungs- und/oder Erstellungs- rechten(Creator, Lehrer & Administrationsrechte). ',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Arten von gesammelten Daten',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Wir speichern Nutzernamen um Inhalte einer Nutzung zuzuordnen. Um einen Nutzernamen sicher nur der Person zuzuweisen wird ebenfalls ein Passwort verwendet. Dieses wird bei der Übertragung eines Gerätes verschlüsselt und so sicher verwahrt. Um unseren Dienst der Songwünsche bereitzustellen wird eine Abstimmung für den jewaligen Song anonym gespeichert und ggf. öffentlich einsehbar gemacht. Außerdem kann es zum speichern der IP Adresse des Nutzers kommen, sofern dieser den Discodienst nutzt und auf die Server von Google zugreift. Ab hier gelten die Google Terms of Service und die Privacy Policy von Google.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            Space(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        shadowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Data.colorSelected),
                        splashFactory: InkRipple.splashFactory,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide.none))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ArticlePolicy().build(context);
                      }));
                    },
                    child: const Text('Weitere Informationen zur Inhaltserstellung')),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Text(
                'Datenschutzrechte der Benutzer',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Es kann jederzeit eine Löschung des Accounts und damit eine Löschung aller personenbezogenden Daten manuell im Einstellungstab ausgeführt werden. Falls der Nutzer aus irgendeinem Grund keinen Zugang zu der Application hat, kann er jederzeit eine Löschung über die Mail shutter.sup.dev@gmail.com einleiten(ggf. mit Bearbeitungszeit).',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Datenweitergabe',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Datenweitergabe erfolgt nur an Google bei der Nutzung des "Discodienstes". Dies liegt daran, dass der jewalige Server die IP Adresse speichert und die jewalige Sitzung über die Application aufgebaut wird. Sonst erfolgt keine Weitergabe deiner Daten, egal ob anonym oder personenbezogen.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Datenspeicherung und Aufbewahrungsdauer',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Wie bereits genannt werden sensible Daten wie das Passwort verschlüsselt. Daten wie der Nutzername werden es nicht. Das liegt daran, dass eben dieser ein öffentliches Objekt ist, was auch bei Interaktionen wie dem schreiben eines Kommentares oder dem verfassen eines Artikels öffentlich einsehbar ist. Daten werden in der Regel solange gespeichert bis der Nutzer eine Löschung seines Kontos beantragt oder die Datenbank gereinigt wird.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Cookies und Tracking-Technologien',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Da die Application nicht kommerziell genutzt wird, gibt es keinerlei Tracking oder Cookie Technologien.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Datensicherheit',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Die Datenbank läuft auf aktuellen Versionen des Betriebssystems und Sicherheitsupdates werden häufig durchgeführt. Wie bereits erwähnt werden sensible Daten, wie das Passwort verschlüsselt. Der Schlüssel wird lokal aufbewahrt.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Änderungen an der Datenschutzbestimmung',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Falls eine Änderung der Datenschutzbestimmungen anliegt, wird die geänderte Version bereits mindestens 5 Tage vor der Änderung öffentlich unter dem Menü im Informationstab bereitsgestellt und alle Nutzer erhalten eine Meldung zum Hochladedatum und eine Meldung zum Änderungsdatum.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Anwendbares Recht und Gerichtsstand',
                textAlign: TextAlign.center,
                textScaleFactor: 1.9,
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
                'Der Datenschutz der Application Shutter unterliegt dem Niedersächsischen Gericht und dem Niedersächsischen Schulgesetzes (NSchG).',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Data.colorText,
                ),
              ),
            ),
            Space(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shadowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Data.colorSelected),
                      splashFactory: InkRipple.splashFactory,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide.none))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ArticlePolicy().build(context);
                    }));
                  },
                  child: const Text('Creator- & Lehrer- Datenverarbeitung',
                      textScaleFactor: 0.8),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shadowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Data.colorSelected),
                      splashFactory: InkRipple.splashFactory,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide.none))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InAppWebViewScreen(
                          url:
                              'https://www.mk.niedersachsen.de/startseite/schule/schulorganisation/schultrager/schultraeger--5821.html');
                    }));
                  },
                  child: const Text('NSchG', textScaleFactor: 0.8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
