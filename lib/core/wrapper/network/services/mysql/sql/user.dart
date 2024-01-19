import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/account.dart';
import 'package:shutter/core/object/user/permissions.dart';
import 'package:shutter/core/object/user/user.dart';
import 'package:shutter/core/wrapper/general/crypter.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

///The class wich provided all methods for user managing with the mySQl.
///
///I really recommend to use this class via a Database "instance",
///because i will update all sql classes to improve performance.
class SQlUser {
  ///Save a user and insert it in the mySQl wich data that is given by the Database class.
  ///
  ///If the user already exists, it will be updated. The password will always be encrypted.
  ///For more information about the encryption look at the ShutterSafety() class.
  Future<void> save(User user) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    const query = """
    INSERT INTO ${Database.sqtUser} (username, permission_enum, decrypted_password, creator_id)
    VALUES (?, ?, ?, ?)
    ON DUPLICATE KEY UPDATE
    permission_enum = VALUES(permission_enum),
    decrypted_password = VALUES(decrypted_password),
    creator_id = VALUES(creator_id)
  """;

    try {
      String pw = await ShutterSafety().encryptString(user.password);
      await connection
          .query(query, [user.name, user.permissions.name, pw, Data.creatorID]);
      print("User inserted/updated successfully");
    } catch (e) {
      print("Error inserting/updating user: $e");
    } finally {
      connection.close();
    }
  }

  Future<List<String>> listing() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    List<String> usernames = [];

    try {
      Results results =
          await connection.query('SELECT username FROM user_data');
      for (var row in results) {
        usernames.add(row['username'] as String);
      }
    } finally {
      await connection.close();
    }

    return usernames;
  }

  ///For removing of the provided user. In the logs you can see the result.
  ///(!) MySQl-data is given by the Database class.
  ///
  Future<void> remove(String username) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    final query = "DELETE FROM ${Database.sqtUser} WHERE username = ?";

    try {
      await connection.query(query, [username]);
      print("User with username '$username' deleted successfully");
    } catch (e) {
      print("Error deleting user: $e");
    } finally {
      await connection.close();
    }
  }

  ///Gets a user by his name out of the mySQl database and return it in a async func.
  Future<User?> get(String username) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));

    final query = "SELECT * FROM ${Database.sqtUser} WHERE username = ?";

    try {
      final results = await connection.query(query, [username]);
      if (results.isNotEmpty) {
        final userDataRow = results.first;
        final Map<String, String?> userData = {
          'username': userDataRow['username'],
          'permission_enum': userDataRow['permission_enum'],
          'decrypted_password': userDataRow['decrypted_password'],
          'creator_id': userDataRow['creator_id'],
        };
        String pw = await ShutterSafety()
            .decryptString(userData['decrypted_password']!);
        return User(
            name: userData['username']!,
            password: pw,
            permissions: Account().parse(userData['permission_enum']!));
      } else {
        print("User not found: $username");
        return null;
      }
    } catch (e) {
      print("Error retrieving user data: $e");
      return null;
    } finally {
      await connection.close();
    }
  }

  Future<void> setPermission(String name, Permissions permission) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlAdminUser,
      password: Database.sqlAdminPassword,
      db: Database.sql,
    ));

    const query =
        "UPDATE ${Database.sqtUser} SET permission_enum = ? WHERE username = ?";

    try {
      await connection.query(query, [permission.name, name]);
      print("Users permission updated successfully");
    } catch (e) {
      print("Error inserting/updating users permission: $e");
    } finally {
      connection.close();
    }
  }
}
