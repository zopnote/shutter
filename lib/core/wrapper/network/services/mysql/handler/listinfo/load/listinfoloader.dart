import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/object/user/permissions.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/listinfo/cache/listinfocontainer.dart';

class ListInfoLoader {
  static Future<void> execute() async {
    List<String> list = await Database.listInfo().listing();
    if (list.isEmpty) {
      ListInfoContainer.infos.add(ListInfoContainer.nothing);
      ListInfoContainer.infoEntry.add(ListInfoContainer.nothing.createEntry());
      return;
    }
    for (String address in list) {
      ListInfo? listInfo = await Database.listInfo().get(address);
      if (listInfo != null) {
        ListInfoContainer.infos.add(listInfo);
        ListInfoContainer.infoEntry.add(GestureDetector(
          child: listInfo.createEntry(),
          onLongPress: () async {
            if (Data.user!.permissions == Permissions.Administrator) {
              await Database.listInfo().delete(address);
              ListInfoContainer.infoEntry = [];
              await ListInfoLoader.execute();
            }
          },
        ));
      } else {
        print(
            'Error: ListInfo with address $address is null because the listinfo could not be generated.');
      }
    }
    if (ListInfoContainer.infos.isEmpty &&
        ListInfoContainer.infoEntry.isEmpty) {
      ListInfoContainer.infos.add(ListInfoContainer.nothing);
      ListInfoContainer.infoEntry.add(ListInfoContainer.nothing.createEntry());
    }
  }
}
