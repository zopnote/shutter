import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class SQlSongs {
  Future<void> save(String title) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));
    try {
      final results = await connection
          .query('SELECT * FROM ${Database.sqtSong} WHERE song = ?', [title]);
      if (results.isNotEmpty) {
        await connection.query(
            'UPDATE ${Database.sqtSong} SET votes = votes + 1 WHERE song = ?',
            [title]);
      } else {
        await connection.query(
            'INSERT INTO ${Database.sqtSong} (song, votes) VALUES (?, 1)',
            [title]);
      }
    } catch (e) {
      throw Exception("Error; Unknown cause: $e");
    } finally {
      connection.close();
    }
  }

  Future<Map<String, int>> fetch() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    try {
      final results =
          await connection.query('SELECT song, votes FROM ${Database.sqtSong}');

      final List<MapEntry<String, int>> songDataList = [];

      for (var row in results) {
        final song = row['song'] as String;
        final votes = row['votes'] as int;
        songDataList.add(MapEntry(song, votes));
      }

      songDataList.sort((a, b) => b.value.compareTo(a.value));

      final sortedSongDataMap = Map.fromEntries(songDataList);

      return sortedSongDataMap;
    } catch (e) {
      print('Fehler beim Abrufen der Daten aus der Datenbank: $e');
      return {};
    } finally {
      await connection.close();
    }
  }
}
