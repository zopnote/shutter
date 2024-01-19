import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/visual/home/widgets/start/widgets/appointment/appointmentcreation.dart';

class Appointments {
  static List<Widget> appointments = [];

  List<Widget> get() {
    if (appointments.isEmpty) {
      return [
        ListInfo(
                //0xFF3E4579
                color: const Color(0xFF3E4579),
                icon: Ionicons.analytics,
                title: 'Keine.',
                description: 'Du hast momentan keine Einträge.')
            .createEntry(),
      ];
    }
    return appointments;
  }

  Future<void> loadAppointments() async {}

  void addAppointments(
      String title, String description, Color color, IconData iconData) {
    appointments.add(entry(title, description, color, iconData));
  }

  void showCreatePage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppointmentCreation();
      },
    );
  }

  Widget entry(
      String title, String description, Color color, IconData iconData) {
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
                iconData,
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
