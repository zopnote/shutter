import 'dart:convert';

import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/displaylocation.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/article/articlemanager.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/article/shpref/articlebyown.dart';

class SQlArticle {
  Future<List<String>> listing(DisplayLocation location) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        "SELECT address FROM ${Database.sqlArticle} WHERE display_location_enum = ? AND published = true ORDER BY id DESC";

    final Results results = await connection.query(query, [location.name]);

    final addresses = <String>[];
    for (var row in results) {
      final address = row[0] as String;
      addresses.add(address);
    }

    await connection.close();
    return addresses;
  }

  Future<void> insert(DisplayLocation location, Article article) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    const query =
        "INSERT INTO ${Database.sqlArticle} (display_location_enum, address, json_data, published) VALUES (?, ?, ?, ?)";
    final jsonDataString = json.encode(article.toJson());

    try {
      await connection.query(
          query, [location.name, article.articleID, jsonDataString, false]);
      Artibywn.addValue(article.articleID!);
      print("Article inserted successfully");
    } catch (e) {
      print("Error inserting article: $e");
    }
  }

  Future<Article?> delete(String articleID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    final query = "DELETE FROM ${Database.sqlArticle} WHERE address = ?";

    try {
      await connection.query(query, [articleID]);
      print("Article with address '$articleID' deleted successfully");
    } catch (e) {
      print("Error deleting article: $e");
    } finally {
      await connection.close();
    }
    return null;
  }

  Future<Article?> get(String articleID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    const query =
        "SELECT json_data FROM ${Database.sqlArticle} WHERE address = ?";

    final Results results = await connection.query(query, [articleID]);

    if (results.isNotEmpty) {
      ResultRow row = results.first;
      await connection.close();
      return ArticleManager.generateArticle(row[0].toString());
    }
    await connection.close();
    return null;
  }
}
