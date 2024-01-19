import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/sharedpref.dart';
import 'package:shutter/core/object/user/permissions.dart';
import 'package:shutter/core/wrapper/general/crypter.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class Creator {
  static Future<String> _encrypt(String value) async {
    return await ShutterSafety().encryptString(value);
  }

  static Future<String> _decrypt(String value) async {
    return await ShutterSafety().decryptString(value);
  }

  static Future<int> signIn(String name, String password) async {
    try {
      if (Data.user!.permissions == Permissions.Nutzer) {
        Database.user().setPermission(Data.user!.name, Permissions.Creator);
      }
    } catch (e) {}
    if (!(await Database.creator().isRegistered(name))) {
      await Database.creator().create(name, password);
      List<dynamic> users = await Database.creator().getUsers(name);
      users.add(Data.user!.name);
      await Database.creator().insertUsers(name, users);
      await SharedPref.saveString('creator.id', name);
      await SharedPref.saveString('creator.pw', await _encrypt(password));
      Data.creatorID = name;
      return 0;
    }
    return 409;
  }

  static Future<void> signOut() async {
    if (await isLoggedIn()) {
      String? creatorID = await SharedPref.loadString('creator.id');
      if (creatorID != null && creatorID == Data.creatorID!) {
        await Database.creator().delete(creatorID);
        await SharedPref.removeString('creator.id');
        await SharedPref.removeString('creator.pw');
      }
    }
    Data.creatorID = null;
  }

  static Future<bool> isLoggedIn() async {
    String? creatorID = await SharedPref.loadString('creator.id');
    String? creatorPW = await SharedPref.loadString('creator.pw');
    if (creatorID != null) {
      if (creatorPW != null) {
        if (await Database.creator().isRegistered(creatorID)) {
          String dbPW = (await Database.creator().getPassword(creatorID))!;
          if (dbPW == await _decrypt(creatorPW)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static Future<void> load() async {
    if (await isLoggedIn()) {
      String? creatorID = await SharedPref.loadString('creator.id');
      String? creatorPW = await SharedPref.loadString('creator.pw');
      logIn(creatorID!, await _decrypt(creatorPW!));
    }
  }

  ///The password must be decrypted at this point.
  static Future<int> logIn(String name, String password) async {
    try {
      if (Data.user!.permissions == Permissions.Nutzer) {
        Database.user().setPermission(Data.user!.name, Permissions.Creator);
      }
    } catch (e) {}
    if (await Database.creator().isRegistered(name)) {
      if (await Database.creator().getPassword(name) == password) {
        List<dynamic> users = await Database.creator().getUsers(name);
        if (!users.contains(Data.user!.name)) {
          users.add(Data.user!.name);
          await Database.creator().insertUsers(name, users);
        }
        await SharedPref.saveString('creator.id', name);
        await SharedPref.saveString('creator.pw', await _encrypt(password));
        Data.creatorID = name;
        return 0;
      }
      return 403;
    }
    return 404;
  }

  static Future<void> addArticle(String name, String articleID) async {
    List<dynamic> articles = await Database.creator().getArticles(articleID);
    articles.add(articleID);
    await Database.creator().insertArticles(name, articles);
  }

  static Future<void> removeArticle(String name, String articleID) async {
    List<dynamic> articles = await Database.creator().getArticles(articleID);
    articles.remove(articleID);
    await Database.creator().insertArticles(name, articles);
  }

  static Future<void> logOut() async {
    if (await isLoggedIn()) {
      String? creatorID = await SharedPref.loadString('creator.id');
      if (creatorID != null) {
        List<dynamic> users = await Database.creator().getUsers(creatorID);
        if (users.contains(Data.user!.name)) {
          users.remove(Data.user!.name);
          await Database.creator().insertUsers(creatorID, users);
        }
        await SharedPref.removeString('creator.id');
        await SharedPref.removeString('creator.pw');
      }
    }
    Data.creatorID = null;
  }
}
