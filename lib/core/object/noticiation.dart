import 'dart:core';

///The notification class includes the blueprint
///for a notification that can be displayed with functions provided by the (SQlNotify) class.
///
///You insert a notification with the SQlNotify class and it will automatic displayed via the
///(Notify) class.
///
///~ Adlay 2023 - Q4 v1.0 ~ Zopnote
class Notification {
  String address;
  int icon;
  String title;
  String description;

  Notification({
    required this.address,
    required this.icon,
    required this.title,
    required this.description,
  });
}
