import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/visual/cantinecard/cantinecard.dart';
import 'package:shutter/core/visual/cantinecard/children/cantinecardentry.dart';
import 'package:shutter/core/visual/cantinecard/children/weekday.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class SQlCantine {
  Future<void> save(CantineCard cantineCard) async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    await Database.truncateTable(Database.sqlCantine);
    List<String> list = [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday'
    ];
    try {
      for (String day in list) {
        late CantineCardEntry cantineCardEntry;
        if (day == 'monday') {
          cantineCardEntry = cantineCard.monday;
        }
        if (day == 'tuesday') {
          cantineCardEntry = cantineCard.tuesday;
        }
        if (day == 'wednesday') {
          cantineCardEntry = cantineCard.wednesday;
        }
        if (day == 'thursday') {
          cantineCardEntry = cantineCard.thursday;
        }
        if (day == 'friday') {
          cantineCardEntry = cantineCard.friday;
        }
        await connection.query(
          'INSERT INTO ${Database.sqlCantine} (date, weekday_enum_value, regular_dinner, regular_dinner_description, '
          'vegetarian_dinner, vegetarian_dinner_description) '
          'VALUES (?, ?, ?, ?, ?, ?)',
          [
            cantineCard.date,
            cantineCardEntry.weekday.name,
            cantineCardEntry.regularDinnerTitle,
            cantineCardEntry.regularDinnerDescription,
            cantineCardEntry.vegetarianDinnerTitle,
            cantineCardEntry.vegetarianDinnerDescription,
          ],
        );
      }
      print("CantineCard inserted successfully");
    } catch (e) {
      print("Error inserting CantineCard: $e");
    }
    await connection.close();
  }

  Future<CantineCard> get() async {
    final MySqlConnection connection =
        await MySqlConnection.connect(ConnectionSettings(
      host: Database.sqlHost,
      port: Database.sqlPort,
      user: Database.sqlUser,
      password: Database.sqlPassword,
      db: Database.sql,
    ));
    List<String> list = [
      Weekday.Monday.name,
      Weekday.Tuesday.name,
      Weekday.Wednesday.name,
      Weekday.Thursday.name,
      Weekday.Friday.name,
    ];
    List<CantineCardEntry> entry = [];
    List<String> dates = [];
    for (String value in list) {
      var result = await connection.query(
        'SELECT date, regular_dinner, regular_dinner_description, vegetarian_dinner, vegetarian_dinner_description FROM ${Database.sqlCantine} WHERE weekday_enum_value = ?',
        [value],
      );
      if (result.isNotEmpty) {
        ResultRow row = result.first;
        String date = row[0] as String;
        String regularDinnerTitle = row[1] as String;
        String regularDinnerDescription = row[2].toString();
        String vegetarianDinnerTitle = row[3] as String;
        String vegetarianDinnerDescription = row[4].toString();
        dates.add(date);
        entry.add(CantineCardEntry(
          Weekdays.parse(value),
          regularDinnerTitle: regularDinnerTitle,
          regularDinnerDescription: regularDinnerDescription,
          vegetarianDinnerTitle: vegetarianDinnerTitle,
          vegetarianDinnerDescription: vegetarianDinnerDescription,
        ));
      }
    }
    await connection.close();
    try {
      return CantineCard(
        monday: entry.elementAt(0),
        tuesday: entry.elementAt(1),
        wednesday: entry.elementAt(2),
        thursday: entry.elementAt(3),
        friday: entry.elementAt(4),
        date: dates.first,
      );
    } catch (e) {
      print('No useable entry in database for CantineCard. Extended: $e');
      return CantineCard(
          monday: CantineCardEntry(Weekday.Monday,
              regularDinnerTitle: 'Mensakarte nicht',
              regularDinnerDescription: '',
              vegetarianDinnerTitle: 'erfolgreich abgerufen.',
              vegetarianDinnerDescription: ''),
          tuesday: CantineCardEntry(Weekday.Tuesday,
              regularDinnerTitle: 'Mensakarte nicht',
              regularDinnerDescription: '',
              vegetarianDinnerTitle: 'nicht abgerufen.',
              vegetarianDinnerDescription: ''),
          wednesday: CantineCardEntry(Weekday.Wednesday,
              regularDinnerTitle: 'Mensakarte nicht',
              regularDinnerDescription: '',
              vegetarianDinnerTitle: 'nicht abgerufen.',
              vegetarianDinnerDescription: ''),
          thursday: CantineCardEntry(Weekday.Thursday,
              regularDinnerTitle: 'Mensakarte nicht',
              regularDinnerDescription: '',
              vegetarianDinnerTitle: 'nicht abgerufen.',
              vegetarianDinnerDescription: ''),
          friday: CantineCardEntry(Weekday.Friday,
              regularDinnerTitle: 'Mensakarte nicht',
              regularDinnerDescription: '',
              vegetarianDinnerTitle: 'nicht abgerufen.',
              vegetarianDinnerDescription: ''),
          date: "");
    }
  }
}
