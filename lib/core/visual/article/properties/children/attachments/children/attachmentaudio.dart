import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/container/data.dart';
import 'attachment.dart';

class AttachmentAudio extends Attachment {
  final String name;
  final String url;

  AttachmentAudio({
    required this.url,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }

  @override
  String getName() {
    return name;
  }

  @override
  State<AttachmentAudio> createState() => _AttachmentAudioState();
}

class _AttachmentAudioState extends State<AttachmentAudio> {
  bool isplaying = false;
  bool audioplayed = false;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var element in Data.audioPlayers) {
      element.stop();
    }
    super.dispose();
    setState(() {
      isplaying = false;
      audioplayed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Data.audioPlayers.add(player);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Wrap(
            spacing: 10,
            children: [
              ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                  ),
                  onPressed: () async {
                    if (!isplaying && !audioplayed) {
                      await player.play(UrlSource(widget.url));
                      setState(() {
                        isplaying = true;
                        audioplayed = true;
                      });
                    }
                    Duration? current = await player.getCurrentPosition();
                    Duration modifier = const Duration(seconds: 10);
                    Duration nonNull = current!;
                    Duration newPostion = nonNull -= modifier;
                    await player.seek(newPostion);
                    setState(() {
                      isplaying = true;
                      audioplayed = true;
                    });
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                  label: Text("-10s")),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                  ),
                  onPressed: () async {
                    if (!isplaying && !audioplayed) {
                      await player.play(UrlSource(widget.url));
                      setState(() {
                        isplaying = true;
                        audioplayed = true;
                      });
                    } else if (audioplayed && !isplaying) {
                      await player.resume();
                      //resume success
                      setState(() {
                        isplaying = true;
                        audioplayed = true;
                      });
                    } else {
                      await player.pause();
                      setState(() {
                        isplaying = false;
                      });
                    }
                  },
                  icon: Icon(isplaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded),
                  label: Text(isplaying ? "Pausieren" : "Abspielen")),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                  ),
                  onPressed: () async {
                    if (!isplaying && !audioplayed) {
                      await player.play(UrlSource(widget.url));
                      setState(() {
                        isplaying = true;
                        audioplayed = true;
                      });
                    }
                    Duration? current = await player.getCurrentPosition();
                    Duration modifier = const Duration(seconds: 10);
                    Duration nonNull = current!;
                    Duration newPostion = nonNull += modifier;
                    await player.seek(newPostion);
                    setState(() async {
                      isplaying = true;
                      audioplayed = true;
                    });
                  },
                  label: Text("+10s"),
                  icon: Icon(Icons.arrow_forward_rounded)),
            ],
          ),
        )
      ],
    );
  }
}
