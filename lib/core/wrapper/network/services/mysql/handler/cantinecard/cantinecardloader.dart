import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/cantinecard/cantinecardcontainer.dart';

class CantineCardLoader {
  static Future<void> execute() async {
    try {
      CantineCardContainer.cantineCard = await Database.cantine().get();
    } catch (e) {}
  }
}
