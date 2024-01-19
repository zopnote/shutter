import 'dart:math';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';

///This is the class of Shutter wich is responsible for crypting.
///The encryptionkey is secret.
///If any developer break our rules and show the key to third-party-persons, he also break the rules of law.
///
///The key is stored in a asset.
class ShutterSafety {
  ///For encrypting(Verschlüsseln) of a key.
  Future<String> encryptString(String plainText) async {
    final iv = IV(Uint8List.fromList([
      41,
      47,
      249,
      85,
      57,
      250,
      191,
      247,
      51,
      122,
      245,
      2,
      46,
      203,
      93,
      205
    ]));
    final encrypted = (await ShutterEncrypt())!.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  ///For decrypting(Entschlüsseln) od a key.
  Future<String> decryptString(String encryptedText) async {
    final encrypted = Encrypted.fromBase64(encryptedText);
    final iv = IV(Uint8List.fromList([
      41,
      47,
      249,
      85,
      57,
      250,
      191,
      247,
      51,
      122,
      245,
      2,
      46,
      203,
      93,
      205
    ]));
    final decrypted = (await ShutterEncrypt())!.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  ///It return the key in a byte-array.
  ///
  Future<Encrypter?> ShutterEncrypt() async {
    try {
      final encryptedText = await rootBundle.loadString('assets/256Key');
      int index = 0;
      List<int> elements = [];
      while (index < encryptedText.length) {
        String string = encryptedText.substring(index, index + 2);
        int i = int.parse("0x$string");
        elements.add(i);
        index += 2;
      }
      final key = Key(Uint8List.fromList(elements));
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      return encrypter;
    } catch (e) {
      print('Fehler beim Lesen der Datei: $e');
      return null;
    }
  }
}

List<int> generate256BitKey() {
  final random = Random.secure();
  final keyBytes =
      List<int>.generate(32, (_) => random.nextInt(256)); // 256-Bit key
  return keyBytes;
}
