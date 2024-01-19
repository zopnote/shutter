import 'dart:io';

import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/sharedpref.dart';
import 'package:shutter/core/object/user/permissions.dart';
import 'package:shutter/core/wrapper/general/crypter.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';

import '../../../object/user/user.dart';

class Account {
  static String? userName;
  static String? userPassword;

  ///Check login data in SharedPreferences. It also check if an entry exists in the database.
  static Future<bool> isConnected() async {
    Map<String, String>? map = await getLocal();
    if (map != null) {
      if (map['name'] != null && map['password'] != null) {
        User? user = await Database.user().get(map['name']!);
        if (user != null) {
          if (user.password == map['password']) {
            return true;
          }
          return false;
        }
        return false;
      }
      return false;
    }
    return false;
  }

  ///This is the sign in method. It insert the user in the database and check if this was successful.
  ///A new user will get the Permissions.Nutzer permission.
  static Future<bool> signIn(String name, String password) async {
    if ((await Database.user().get(name)) != null) {
      return false;
    }
    User user =
        User(name: name, password: password, permissions: Permissions.Nutzer);
    await Database.user().save(user);
    User? check = await Database.user().get(name);
    if (check != null) {
      Data.user = check;
      setLocal(name, password);
      return true;
    }
    return false;
  }

  ///Change the password of the connected user (via. Data.user!).
  static Future<bool> changePassword(String password) async {
    User? check = await Database.user().get(Data.user!.name);
    if (check != null) {
      User newU = User(
          name: Data.user!.name,
          password: password,
          permissions: check.permissions);
      await Database.user().remove(check.name);
      await Database.user().save(newU);
      Data.user = newU;
      setLocal(Data.user!.name, password);
      return true;
    }
    return false;
  }

  ///Logs in the account wich is provided by sharedPreferences via the string 'accountName'
  static Future<int> logIn(String name, String password) async {
    User? user = await Database.user().get(name);
    if (user != null) {
      if (user.password == password) {
        Data.user = user;
        setLocal(name, password);
        return 0;
      }
      return 403;
    }
    return 404;
  }

  ///Delete everything witch is provided by the account and itself. (To do it the Data.user.password must be same as in the database)
  static Future<bool> logOut() async {
    User? user = await Database.user().get(Data.user!.name);
    if (user != null) {
      if (user.password == Data.user!.password) {
        Data.user = user;
        SharedPref.removeString('accountName');
        SharedPref.removeString('accountPassword');
        exit(0);
      }
      return false;
    }
    return false;
  }

  ///Delete everything witch is provided by the account and itself. (To do it the Data.user.password must be same as in the database)
  static Future<bool> delete() async {
    User? user = await Database.user().get(Data.user!.name);
    if (user != null) {
      if (user.password == Data.user!.password) {
        await Database.user().remove(Data.user!.name);
        exit(0);
      }
      return false;
    }
    return false;
  }

  static Future<void> setLocal(String name, String password) async {
    SharedPref.saveString('accountName', name);
    String crypted = await ShutterSafety().encryptString(password);
    SharedPref.saveString('accountPassword', crypted);
  }

  static Future<Map<String, String>?> getLocal() async {
    String? name = await SharedPref.loadString('accountName');
    String? passwordEncrypt = await SharedPref.loadString('accountPassword');
    if (name == null || passwordEncrypt == null) {
      return null;
    }
    String password = await ShutterSafety().decryptString(passwordEncrypt);
    return {
      'name': name,
      'password': password,
    };
  }

  static Future<void> load() async {
    if (await isConnected()) {
      Map<String, String>? map = await getLocal();
      if (map != null) {
        if (await logIn(map['name']!, map['password']!) == 404) {
          await signIn(map['name']!, map['password']!);
        } else {
          userName = map['name'];
          userPassword = map['password'];
        }
      }
    }
  }

  Permissions parse(String value) {
    return Permissions.values.firstWhere(
      (permission) => permission.toString() == 'Permissions.$value',
      orElse: () => Permissions.Nutzer,
    );
  }
}
