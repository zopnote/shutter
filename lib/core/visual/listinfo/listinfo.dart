import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ListInfo {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  String? creatorID;
  String? infoID;

  ListInfo({
    this.infoID,
    this.creatorID,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
  }) {
    creatorID ??= 'shutter';
    infoID ??= const Uuid().v4();
  }

  Map<String, dynamic> toJson() {
    return {
      'infoID': infoID,
      'creatorID': creatorID,
      'icon': icon.codePoint,
      'title': title,
      'description': description,
      'color': color.value,
    };
  }

  Widget createEntry() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          CircleAvatar(
            radius: 24,
            backgroundColor: color,
            child: Align(
              alignment: const Alignment(0, -0.1),
              child: Icon(
                icon,
                size: 30,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textScaleFactor: 1.4,
                style: const TextStyle(
                    color: Color(0xFF414141), fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                textScaleFactor: 1.0,
                style: const TextStyle(
                  color: Color(0xFF414141),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
