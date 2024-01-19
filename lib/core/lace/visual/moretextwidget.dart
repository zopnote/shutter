import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';

class MoreTextWidget extends StatefulWidget {
  final int maxLength;
  final String fullText;
  final double textScaleFactor;
  final FontWeight fontWeightOfText;

  MoreTextWidget(
      {required this.maxLength,
      required this.fullText,
      required this.textScaleFactor,
      required this.fontWeightOfText});

  @override
  _MoreTextWidgetState createState() => _MoreTextWidgetState();
}

class _MoreTextWidgetState extends State<MoreTextWidget> {
  bool isFullTextVisible = false;

  @override
  Widget build(BuildContext context) {
    final String displayText = isFullTextVisible
        ? widget.fullText
        : widget.fullText.substring(0, widget.maxLength);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          textScaleFactor: widget.textScaleFactor,
          style: TextStyle(
              color: Data.colorText, fontWeight: widget.fontWeightOfText),
        ),
        if (widget.fullText.length > widget.maxLength)
          GestureDetector(
            onTap: () {
              setState(() {
                isFullTextVisible = !isFullTextVisible;
              });
            },
            child: Text(
              isFullTextVisible ? "Weniger anzeigen" : "Mehr anzeigen",
              style: TextStyle(
                  color: Data.colorSelected, fontWeight: FontWeight.bold),
              textScaleFactor: widget.textScaleFactor,
            ),
          ),
      ],
    );
  }
}
