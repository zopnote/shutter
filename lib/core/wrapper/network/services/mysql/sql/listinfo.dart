import 'dart:convert';

import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/listinfo/listinfomanager.dart';

class SQlListInfo {
  Future<List<String>> listing() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    final results = await connection.query(
        'SELECT address FROM ${Database.sqtInfo} WHERE published = true');

    final addresses = <String>[];
    for (var row in results) {
      final address = row[0] as String;
      addresses.add(address);
    }

    await connection.close();
    return addresses;
  }

  Future<void> insert(ListInfo listInfo) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    const query =
        "INSERT INTO ${Database.sqtInfo} (address, json_data, published) VALUES (?, ?, ?)";
    final jsonDataString = json.encode(listInfo.toJson());

    try {
      await connection.query(query, [listInfo.infoID, jsonDataString, 0]);
      print("Info inserted successfully");
    } catch (e) {
      print("Error inserting info: $e");
    }
    await connection.close();
  }

  Future<void> delete(String infoID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    final query = "DELETE FROM ${Database.sqtInfo} WHERE address = ?";

    try {
      await connection.query(query, [infoID]);
      print("Info with address '$infoID' deleted successfully");
    } catch (e) {
      print("Error deleting info: $e");
    } finally {
      await connection.close();
    }
  }

  Future<ListInfo?> get(String infoID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    const query = "SELECT json_data FROM ${Database.sqtInfo} WHERE address = ?";

    final Results results = await connection.query(query, [infoID]);

    if (results.isNotEmpty) {
      ResultRow row = results.first;
      await connection.close();
      return ListInfoManager.generateListInfo(row[0].toString());
    }
    return null;
  }
}
