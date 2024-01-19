import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/visual/article/properties/children/articlepageattachments.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'children/attachment.dart';

class AttachmentPage extends StatefulWidget {
  final ArticlePageAttachments attachments;

  const AttachmentPage(this.attachments, {super.key});

  @override
  State<AttachmentPage> createState() => _AttachmentPageState();
}

class _AttachmentPageState extends State<AttachmentPage>
    with TickerProviderStateMixin {
  late TabController _imageController;
  late TabController _audioController;

  @override
  void dispose() {
    super.dispose();
    _imageController.dispose();
    _audioController.dispose();
    for (var element in Data.audioPlayers) {
      element.stop();
    }
  }

  Widget getLinks() {
    if (widget.attachments.urls == null) {
      return Container();
    }
    int urlCount = widget.attachments.urls!.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Links ',
              textScaleFactor: 2.6,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Data.colorText,
              ),
            ),
            Text(
              '($urlCount)',
              textScaleFactor: 2.0,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Data.colorText,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SizedBox(
            height: 100,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: widget.attachments.urls!,
            ),
          ),
        ),
      ],
    );
  }

  Widget getImages(TabController tabController) {
    if (widget.attachments.images == null) {
      return Container();
    }
    int imageCount = widget.attachments.images!.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Galerie ',
              textScaleFactor: 2.6,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Data.colorText,
              ),
            ),
            Text(
              '($imageCount)',
              textScaleFactor: 2.0,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Data.colorText,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TabBar(
            controller: _imageController,
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            indicator: RectangularIndicator(
              color: Data.colorText,
              paintingStyle: PaintingStyle.stroke,
              strokeWidth: 15,
              verticalPadding: 15,
              horizontalPadding: 5,
              bottomLeftRadius: 12,
              bottomRightRadius: 12,
              topLeftRadius: 12,
              topRightRadius: 12,
            ),
            tabs: generateTabBar(widget.attachments.images!.cast<Attachment>()),
          ),
        ),
        Center(
          child: SizedBox(
            height: 280,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _imageController,
              children: widget.attachments.images!,
            ),
          ),
        ),
      ],
    );
  }

  Widget getAudios(TabController tabController) {
    if (widget.attachments.audios == null) {
      return Container();
    }
    int audioCount = widget.attachments.audios!.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Audios ',
              textScaleFactor: 2.6,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Data.colorText,
              ),
            ),
            Text(
              '($audioCount)',
              textScaleFactor: 2.0,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Data.colorText,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: TabBar(
              controller: _audioController,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              indicator: RectangularIndicator(
                color: Data.colorText,
                paintingStyle: PaintingStyle.stroke,
                strokeWidth: 15,
                verticalPadding: 15,
                horizontalPadding: 5,
                bottomLeftRadius: 12,
                bottomRightRadius: 12,
                topLeftRadius: 12,
                topRightRadius: 12,
              ),
              tabs:
                  generateTabBar(widget.attachments.audios!.cast<Attachment>()),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 70,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _audioController,
              children: widget.attachments.audios!,
            ),
          ),
        ),
      ],
    );
  }

  TabController tabController(List<Attachment?>? list) {
    if (list == null) {
      return TabController(length: 0, vsync: this);
    } else {
      return TabController(length: list.length, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    _imageController = tabController(widget.attachments.images);
    _audioController = tabController(widget.attachments.audios);
    return MaterialApp(
      color: Data.colorBackground,
      home: Scaffold(
        backgroundColor: Data.colorBackground,
        appBar: AppBar(
          backgroundColor: Data.colorBackground,
          foregroundColor: Data.colorText,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Ionicons.arrow_back, size: 30),
            onPressed: () {
              Navigator.pop(context);
              for (var element in Data.audioPlayers) {
                element.stop();
              }
            },
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            getLinks(),
            const SizedBox(
              height: 20,
            ),
            getImages(_imageController),
            const SizedBox(
              height: 10,
            ),
            getAudios(_audioController),
          ],
        ),
      ),
    );
  }

  List<Widget> generateTabBar(List<Attachment> attachments) {
    List<Widget> widgetsList = [];
    for (int i = 0; i < attachments.length; i++) {
      Widget newWidget = SizedBox(
        height: 58,
        child: Text(
          '\n${attachments.elementAt(i).getName()}',
          textScaleFactor: 1.2,
          style: TextStyle(color: Data.colorText),
        ),
      );
      widgetsList.add(newWidget);
    }
    return widgetsList;
  }
}
