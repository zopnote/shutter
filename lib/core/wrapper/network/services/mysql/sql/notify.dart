import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/object/noticiation.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class SQlNotify {
  Future<Notification?> get(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));
    try {
      final query = 'SELECT * FROM notify_data WHERE address = ?';
      final results = await connection.query(query, [address]);
      if (results.isNotEmpty) {
        final row = results.first;
        return Notification(
          address: row['address'] as String,
          icon: row['icon'] as int,
          title: row['title'] as String,
          description: row['description'] as String,
        );
      } else {
        return null;
      }
    } finally {
      connection.close();
    }
  }

  Future<void> insert(Notification notification) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));
    try {
      final query =
          'INSERT INTO ${Database.sqtNotify} (address, icon, title, description) VALUES (?, ?, ?, ?)';
      await connection.query(query, [
        notification.address,
        notification.icon,
        notification.title,
        notification.description,
      ]);
    } finally {
      connection.close();
    }
  }

  Future<void> delete(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));
    try {
      final query = 'DELETE FROM ${Database.sqtNotify} WHERE address = ?';
      await connection.query(query, [address]);
    } finally {
      connection.close();
    }
  }

  ///Method returns a list of all addresses wich found in the table [Database.sqtNotify].
  Future<List<String>> listing() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));
    try {
      final query = 'SELECT address FROM ${Database.sqtNotify}';
      final results = await connection.query(query);
      final addresses = <String>[];
      for (var row in results) {
        final address = row[0] as String;
        addresses.add(address);
      }
      return addresses;
    } finally {
      connection.close();
    }
  }
}
