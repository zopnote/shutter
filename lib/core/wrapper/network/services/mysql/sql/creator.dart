import 'dart:convert';

import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/wrapper/general/crypter.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class SQlCreator {
  Future<List<String>> listing() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    List<String> names = [];

    try {
      Results results = await connection.query('SELECT name FROM creator_data');
      for (var row in results) {
        names.add(row['name'] as String);
      }
    } finally {
      await connection.close();
    }

    return names;
  }

  Future<void> insertUsers(String creatorID, List<dynamic> jsonUsers) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    final jsonUsersJson = json.encode(jsonUsers);

    try {
      await connection.query(
          'UPDATE creator_data SET json_users = ? WHERE name = ?',
          [jsonUsersJson, creatorID]);

      print('Data successful inserted.');
    } catch (e) {
      print(
          'Error while edit the data entry (Database.insertCreatorUsers()): $e');
    } finally {
      connection.close();
    }
  }

  Future<List<dynamic>> getUsers(String creatorID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    try {
      final result = await connection.query(
        'SELECT json_users FROM creator_data WHERE name = ?',
        [creatorID],
      );

      if (result.isNotEmpty) {
        final row = result.first;
        final List<dynamic> jsonUsersList = json.decode(row[0].toString());
        print('Daten erfolgreich abgerufen.');
        return jsonUsersList;
      } else {
        print('Daten nicht gefunden. (Database.getConnectedUsers())');
        return [];
      }
    } catch (e) {
      print(
          'Fehler beim Versuch, Daten anzuzeigen (Database.getConnectedUsers()): $e');
      return [];
    } finally {
      connection.close();
    }
  }

  Future<void> insertArticles(
      String creatorID, List<dynamic> jsonArticles) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    final jsonArticlesJson = json.encode(jsonArticles);

    try {
      final result = await connection.query(
          'UPDATE creator_data SET json_articles = ? WHERE name = ?',
          [jsonArticlesJson, creatorID]);

      if (result.affectedRows! > 0) {
        print('Data successfully inserted.');
      } else {
        print('Error while updating data (Database.insertCreatorArticles()).');
      }
    } catch (e) {
      print(
          'Error while editing the data entry (Database.insertCreatorArticles()): $e');
    } finally {
      connection.close();
    }
  }

  Future<List<dynamic>> getArticles(String creatorID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    try {
      final result = await connection.query(
          'SELECT json_articles FROM creator_data WHERE name = ?', [creatorID]);

      if (result.isNotEmpty) {
        final row = result.first;
        final jsonArticlesString = row[0];
        final List<dynamic> jsonArticlesList =
            json.decode(jsonArticlesString.toString());
        return jsonArticlesList;
      } else {
        print('Data not found. (Database.getCreatorArticles())');
        return [];
      }
    } catch (e) {
      print(
          'Error while trying to view data (Database.getCreatorArticles()): $e');
      return [];
    } finally {
      connection.close();
    }
  }

  Future<void> delete(String name) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    try {
      final result = await connection.query(
        'DELETE FROM creator_data WHERE name = ?',
        [name],
      );

      if (result.affectedRows! > 0) {
        print('Creator erfolgreich gelöscht.');
      } else {
        print('Creator nicht gefunden oder konnte nicht gelöscht werden.');
      }
    } catch (e) {
      print('Fehler beim Löschen des Creators: $e');
    } finally {
      connection.close();
    }
  }

  Future<void> create(String creatorID, String password) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    try {
      String pw = await ShutterSafety().encryptString(password);
      final result = await connection.query(
          'INSERT INTO creator_data (name, password) VALUES (?, ?)',
          [creatorID, pw]);

      if (result.affectedRows! > 0) {
        print('Daten erfolgreich eingefügt.');
      } else {
        print(
            'Fehler beim Einfügen der Daten (Database.insertCreatorCredentials()).');
      }
    } catch (e) {
      print(
          'Fehler beim Bearbeiten des Datenbankeintrags (Database.insertCreatorCredentials()): $e');
    } finally {
      connection.close();
    }
  }

  Future<String?> getPassword(String creatorID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    try {
      final result = await connection.query(
          'SELECT password FROM creator_data WHERE name = ?', [creatorID]);

      if (result.isNotEmpty) {
        final row = result.first;
        final password = row['password'];
        return await ShutterSafety().decryptString(password);
      } else {
        print('Nutzername nicht gefunden. (Database.getPasswordByUserName())');
        return null;
      }
    } catch (e) {
      print(
          'Fehler beim Abrufen des Passworts (Database.getPasswordByUserName()): $e');
      return null;
    } finally {
      connection.close();
    }
  }

  Future<bool> isRegistered(String creatorID) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    try {
      final result = await connection.query(
          'SELECT COUNT(*) AS count FROM creator_data WHERE name = ?',
          [creatorID]);

      if (result.isNotEmpty) {
        final row = result.first;
        final count = row['count'];
        return count > 0;
      } else {
        print(
            'Fehler beim Überprüfen des Nutzernamens (Database.isUserNameExists())');
        return false;
      }
    } catch (e) {
      print(
          'Fehler beim Überprüfen des Nutzernamens (Database.isUserNameExists()): $e');
      return false;
    } finally {
      connection.close();
    }
  }
}
