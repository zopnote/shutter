import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/general/general.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/article/cache/articlecontainer.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/article/load/articleloader.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/listinfo/cache/listinfocontainer.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/listinfo/load/listinfoloader.dart';
import 'package:shutter/visual/home/widgets/followed.dart';
import 'package:shutter/visual/home/widgets/start/widgets/applications.dart';
import 'package:shutter/visual/home/widgets/start/widgets/widget_rows.dart';
import 'package:shutter/visual/home/widgets/user_cog.dart';
import 'package:vibration/vibration.dart';

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _Start();
}

class _Start extends State<Start> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _secondTabController;
  late double screenWidth;
  late AnimationController animationController;
  static bool loadedA = false;
  static bool loadedL = false;
  static List<Article> spotlight = [];
  static List<Article> projects = [];
  static List<Widget> info = [];

  @override
  void initState() {
    super.initState();
    loadA();
    loadL();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _tabController = TabController(
        length: Widget_Rows.newestInformation.length, vsync: this);
    _secondTabController =
        TabController(length: Widget_Rows.newestSpotlight.length, vsync: this);
    screenWidth = General().getScreenWidth();
  }

  @override
  void dispose() {
    super.dispose();
    _secondTabController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget_Rows.setContext(context);
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _buildAppBar(),
          ];
        },
        body: Center(
          child: SizedBox(
            width: screenWidth,
            child: _buildMainContent(),
          ),
        ),
      ),
    );
  }

  Future<void> loadA() async {
    if (loadedA) {
      return;
    }
    await ArticleLoader.execute();
    spotlight = ArticleContainer.spotlight;
    projects = ArticleContainer.projects;
    loadedA = true;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> loadL() async {
    if (loadedL) {
      return;
    }
    await ListInfoLoader.execute();
    info = ListInfoContainer.infoEntry;
    loadedL = true;
    setState(() {});
  }

  Widget _buildMainContent() {
    return Center(
      child: SizedBox(
        width: screenWidth,
        child: ListView.builder(
          itemCount: 11,
          itemBuilder: (context, index) {
            if (index == 2) {
              if (!loadedL) {
                if (Data.activeAnimations) {
                  return LottieBuilder.asset(
                    'assets/animations/loading.json',
                    height: 100,
                    width: 100,
                  );
                }
                return Center(
                  child: Column(
                    children: [
                      Space(
                        height: 10,
                      ),
                      Text('Lade Daten...',
                          style: TextStyle(
                              color: Data.colorText,
                              fontWeight: FontWeight.w500,
                              fontSize: 21)),
                    ],
                  ),
                );
              }
              return Column(
                children: info,
              );
            }
            if (index == 7) {
              if (!loadedA) {
                if (Data.activeAnimations) {
                  return LottieBuilder.asset(
                    'assets/animations/loading.json',
                    height: 120,
                    width: 120,
                  );
                }
                return Center(
                  child: Column(
                    children: [
                      Space(
                        height: 15,
                      ),
                      Text('Lade Daten...',
                          style: TextStyle(
                              color: Data.colorText,
                              fontWeight: FontWeight.w500,
                              fontSize: 23)),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: spotlight.length,
                        itemBuilder: (context, index) {
                          return spotlight[index].toArticleCard();
                        },
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          return projects[index].toArticleCard();
                        },
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (index == 4) {
              return _buildFunc();
            }
            return widgets[index];
          },
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildFunc() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 60,
                width: 150,
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/branding.jpg').image)),
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
                  onPressed: () {
                    ShutterDialog.showObject(
                        context,
                        SizedBox(
                          width: 390,
                          height: 390,
                          child: Center(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: [
                                const SizedBox(height: 10),
                                LottieBuilder.asset(
                                  'assets/animations/in_development.json',
                                ),
                                Text(
                                  'Dieses Feature ist noch in Entwicklung...',
                                  style: TextStyle(
                                      color: Data.colorText,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  child: const Text(
                    'Funktionen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          Data.activeAnimations
              ? LottieBuilder.asset(
                  'assets/animations/library.json',
                  height: 200,
                  width: 200,
                  frameRate: FrameRate.max,
                  repeat: false,
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44, vertical: 26),
                  child: Icon(Ionicons.book, size: 120),
                ),
          Space(
            width: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      leadingWidth: 70,
      leading: IconButton(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          TablerIcons.user_cog,
          size: 34,
          color: Data.colorBackground,
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => UserCog(),
              transitionDuration: const Duration(milliseconds: 30),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
          );
          if (Data.activeVibration) {
            Vibration.vibrate(duration: 50);
          }
        },
      ),
      actions: <Widget>[
        IconButton(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            TablerIcons.bookmarks,
            size: 32,
            color: Data.colorBackground,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => Followed(),
                transitionDuration: const Duration(milliseconds: 30),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
            if (Data.activeVibration) {
              Vibration.vibrate(duration: 50);
            }
          },
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      backgroundColor: Data.colorSelected,
      expandedHeight: 150,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 0.8),
              child: SizedBox(
                height: 50,
                child: Column(
                  children: [
                    Text(
                      Data.user!.name,
                      style: TextStyle(
                        color: Data.colorBackground,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      Data.user!.permissions.name,
                      style: TextStyle(
                        color: Data.colorBackground,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 0.7,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final List<Widget> widgets = [
    Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        const Text(
          'Informationen',
          textScaleFactor: 2.0,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF414141),
          ),
        ),
        (Data.activeAnimations
            ? LottieBuilder.asset('assets/animations/information.json',
                height: 35, width: 35, repeat: false)
            : const SizedBox()),
      ],
    ),

    const SizedBox(
      height: 10,
    ),

    Column(
      children: ListInfoContainer.infoEntry,
    ),

    Space(),

    const SizedBox(
      height: 0,
    ),

    Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(
          Data.activeAnimations ? 'Inhalte zu ' : 'Projekte & anderes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF414141),
            fontSize: Data.activeAnimations ? 22 : 25,
          ),
        ),
        (Data.activeAnimations
            ? AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'Projekten',
                    speed: const Duration(milliseconds: 200),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      fontSize: 22,
                    ),
                  ),
                  TyperAnimatedText(
                    'Events',
                    speed: const Duration(milliseconds: 200),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      fontSize: 22,
                    ),
                  ),
                  TyperAnimatedText(
                    'Ideen',
                    speed: const Duration(milliseconds: 200),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      fontSize: 22,
                    ),
                  ),
                  TyperAnimatedText(
                    'Clubs',
                    speed: const Duration(milliseconds: 200),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      fontSize: 22,
                    ),
                  ),
                  TyperAnimatedText(
                    'News',
                    speed: const Duration(milliseconds: 200),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      fontSize: 22,
                    ),
                  ),
                  TyperAnimatedText(
                    'Krisen',
                    speed: const Duration(milliseconds: 200),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      fontSize: 22,
                    ),
                  ),
                ],
              )
            : Space()),
        (Data.activeAnimations
            ? LottieBuilder.asset('assets/animations/projects_article.json',
                height: 29, width: 29, repeat: false)
            : const SizedBox()),
      ],
    ),
    const SizedBox(
      height: 10,
    ),

    const SizedBox(),
    //WidgetRows

    const Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Text(
          '\nSchnellzugriff',
          textScaleFactor: 2.0,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF414141),
          ),
        ),
      ],
    ),

    const SizedBox(
      height: 10,
    ),

    Application(),
  ];
}
