import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/wrapper/general/crypter.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';

class SQlSupport {
  Future<List<String>> listingAnswered(String user) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        'SELECT address FROM ${Database.sqtSupport} WHERE user = ? AND answered = true';

    final results = await connection.query(query, [user]);

    await connection.close();

    final addresses = results.map((row) => row[0] as String).toList();

    return addresses;
  }

  Future<List<String>> listingUnanswered() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        'SELECT address FROM ${Database.sqtSupport} WHERE answered = false';

    final results = await connection.query(query);

    await connection.close();

    final addresses = results.map((row) => row[0] as String).toList();

    return addresses;
  }

  Future<Map<String, String?>?> get(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        'SELECT user, address, supporter, message FROM ${Database.sqtSupport} WHERE address = ?';

    final results = await connection.query(query, [address]);

    await connection.close();

    if (results.isNotEmpty) {
      final row = results.first;
      String? message = await ShutterSafety().decryptString(row[3].toString());
      final entry = {
        'address': row[1] as String?,
        'user': row[0] as String?,
        'supporter': row[2] as String?,
        'message': message,
      };
      return entry;
    } else {
      return null;
    }
  }

  Future<void> answer(String address, String message, String supporter) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        'UPDATE support_data SET message = ?, supporter = ?, answered = true WHERE address = ?';

    String msg = await ShutterSafety().encryptString(message);

    await connection.query(query, [msg, supporter, address]);

    await connection.close();
  }

  Future<void> quest(String address, String message, String user) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        'INSERT INTO support_data (address, message, user, answered) VALUES (?, ?, ?, false)';

    String msg = await ShutterSafety().encryptString(message);

    await connection.query(query, [address, msg, user]);

    await connection.close();
  }

  Future<void> remove(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    const query = 'DELETE FROM support_data WHERE address = ?';

    await connection.query(query, [address]);

    await connection.close();
  }

  UnpublishedSQlSupport resources() {
    return UnpublishedSQlSupport();
  }
}

class UnpublishedSQlSupport {
  Future<void> publishArticle(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        'UPDATE ${Database.sqlArticle} SET published = true WHERE address = ?';

    await connection.query(query, [address]);

    await connection.close();
  }

  Future<void> publishInfo(String address) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    const query =
        'UPDATE ${Database.sqtInfo} SET published = true WHERE address = ?';

    await connection.query(query, [address]);

    await connection.close();
  }

  Future<List<String>> unpublishedArticles() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    const query =
        "SELECT address FROM ${Database.sqlArticle} WHERE published = false";

    final Results results = await connection.query(query);

    final addresses = <String>[];
    for (var row in results) {
      final address = row[0] as String;
      addresses.add(address);
    }

    await connection.close();
    return addresses;
  }

  Future<List<String>> unpublishedListInfos() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    final results = await connection.query(
        'SELECT address FROM ${Database.sqtInfo} WHERE published = false');

    final addresses = <String>[];
    for (var row in results) {
      final address = row[0] as String;
      addresses.add(address);
    }

    await connection.close();
    return addresses;
  }
}
