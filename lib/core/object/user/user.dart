import 'package:shutter/core/object/user/permissions.dart';

class User {
  final String password;
  final String name;
  final Permissions permissions;

  User({
    required this.name,
    required this.password,
    required this.permissions,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'permissions': Permission.toJson(permissions),
    };
  }
}
