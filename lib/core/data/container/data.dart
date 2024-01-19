import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/core/data/local/manager/schemes.dart';
import 'package:shutter/core/object/user/user.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/data/articlecontent.dart';
import 'package:shutter/core/visual/article/properties/articleboxproperties.dart';
import 'package:shutter/core/visual/article/properties/articlecardproperties.dart';
import 'package:shutter/core/visual/article/properties/articlepageproperties.dart';
import 'package:shutter/core/visual/article/properties/children/articlecardbackground.dart';
import 'package:shutter/core/visual/article/properties/children/articlepageattachments.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmentaudio.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmenturl.dart';
import 'package:shutter/core/visual/cantinecard/cantinecard.dart';
import 'package:shutter/core/visual/cantinecard/children/cantinecardentry.dart';
import 'package:shutter/core/visual/cantinecard/children/weekday.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';

class Data {
  static List<AudioPlayer> audioPlayers = [];
  static final ListInfo testingInfo = ListInfo(
      color: Color(0xFFA63636),
      icon: TablerIcons.radar,
      title: 'Wlan nicht verfügbar.',
      description: 'Wegen umbauarbeiten aus.');
  static final CantineCard nullCard = CantineCard(
      monday: CantineCardEntry(Weekday.Monday,
          regularDinnerTitle: 'null',
          regularDinnerDescription: 'null',
          vegetarianDinnerTitle: 'null',
          vegetarianDinnerDescription: 'null'),
      tuesday: CantineCardEntry(Weekday.Tuesday,
          regularDinnerTitle: 'null',
          regularDinnerDescription: 'null',
          vegetarianDinnerTitle: 'null',
          vegetarianDinnerDescription: 'null'),
      wednesday: CantineCardEntry(Weekday.Wednesday,
          regularDinnerTitle: 'null',
          regularDinnerDescription: 'null',
          vegetarianDinnerTitle: 'null',
          vegetarianDinnerDescription: 'null'),
      thursday: CantineCardEntry(Weekday.Thursday,
          regularDinnerTitle: 'null',
          regularDinnerDescription: 'null',
          vegetarianDinnerTitle: 'null',
          vegetarianDinnerDescription: 'null'),
      friday: CantineCardEntry(Weekday.Friday,
          regularDinnerTitle: 'null',
          regularDinnerDescription: 'null',
          vegetarianDinnerTitle: 'null',
          vegetarianDinnerDescription: 'null'),
      date: 'null');
  static final Article testingArticle = Article(
    creatorID: 'Zopnote',
    content: ArticleContent(
      title: 'Werde ein \nFlutter Entwickler',
      author: 'flutter.dev',
      description: 'In diesem Artikel \nerfährst du wie!',
      contentText:
          'Take your skills to the next level with the format that works best for you – check out videos, high-quality '
          'documentation, codelabs, and more. Learn new things about Flutter, continue to expand your skills, and stay up to date on the latest '
          'announcements and breaking changes. Take your skills to the next level with the format that works best for you – check out videos, high-quality '
          'documentation, codelabs, and more. Learn new things about Flutter, continue to expand your skills, and stay up to date on the latest '
          'announcements and breaking changes.',
    ),
    cardProperties: ArticleCardProperties(
      openPageOnClick: true,
      textColor: Color(0xFFFFFFFF),
      strokeColorForImageText: Color(0xFFFFFFFF),
      strokeWidthForImageText: 7,
      articleCardBackground:
          ArticleCardBackground(backgroundColor: Color(0xFF36AF79)),
    ),
    boxProperties: ArticleBoxProperties(),
    pageProperties: ArticlePageProperties(
      openPageOnClick: true,
      attachments: ArticlePageAttachments(
        urls: [
          AttachmentUrl(
              name: 'Youtube',
              url: 'https://youtube.com/',
              icon: TablerIcons.brand_youtube),
        ],
        audios: [
          AttachmentAudio(
              url:
                  'https://audio.jukehost.co.uk/ee1fDBSJetTd3PKw78FOxXcSSPDbwTg4',
              name: 'Klassische Musik Example'),
        ],
      ),
    ),
  );

  static bool activeSound = true;
  static bool activeAnimations = true;
  static bool activeVibration = true;
  static User? user;
  static String? creatorID;
  static late Color colorUnselected = Schemes.lightEnvironmentUnselected; // 0
  static late Color colorSelected = Schemes.shutterA; // 1
  static late Color colorBackground = Schemes.lightEnvironmentBackground; // 2
  static late Color colorText = Schemes.lightEnvironmentText; // 3
  Color getTextColor() {
    return colorText;
  }

  Color getSelectedColor() {
    return colorSelected;
  }

  Color getUnselectedColor() {
    return colorUnselected;
  }

  Color getBackgroundColor() {
    return colorBackground;
  }
}
//Preise
//Hauptseite
//Musicwünsche

//Permissionspace
