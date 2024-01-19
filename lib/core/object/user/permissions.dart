enum Permissions { Nutzer, Lehrer, Creator, Administrator }

class Permission {
  static String toJson(Permissions permission) {
    return permission.name;
  }
}
