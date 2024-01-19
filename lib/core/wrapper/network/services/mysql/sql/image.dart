import 'dart:typed_data';

import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class SQlImage {
  Future<void> insert(String address, Uint8List imageBytes) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    try {
      const String query =
          "INSERT INTO ${Database.sqtImage} (address, image) VALUES (?, ?)";
      final List<Object> values = [address, imageBytes];

      final Results results = await connection.query(query, values);
      print("Inserted ${results.affectedRows} row(s)");
    } catch (e) {
      print("Error: $e");
    } finally {
      await connection.close();
    }
  }

  Future<void> delete(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    final query = "DELETE FROM ${Database.sqtImage} WHERE address = ?";

    try {
      await connection.query(query, [address]);
      print("Image with address '$address' deleted successfully");
    } catch (e) {
      print("Error deleting image: $e");
    } finally {
      await connection.close();
    }
  }

  Future<Blob?> get(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    try {
      const String query =
          "SELECT image FROM ${Database.sqtImage} WHERE address = ?";
      final Results results = await connection.query(query, [address]);

      if (results.isNotEmpty) {
        final Blob? imageBytes = results.first[0] as Blob?;
        return imageBytes;
      } else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    } finally {
      await connection.close();
    }
  }
}
