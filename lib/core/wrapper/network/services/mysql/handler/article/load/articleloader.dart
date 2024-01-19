import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/displaylocation.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/article/cache/articlecontainer.dart';

class ArticleLoader {
  static Future<void> execute() async {
    List<Article> spotlight = [];
    List<Article> project = [];
    List<Article> event = [];
    List<String> addressesSpotlight =
        await Database.article().listing(DisplayLocation.Spotlight);
    List<String> addressesProject =
        await Database.article().listing(DisplayLocation.Project);
    List<String> addressesEvent =
        await Database.article().listing(DisplayLocation.Event);
    ArticleContainer.spotlightAddresses = addressesSpotlight;
    ArticleContainer.projectAddresses = addressesProject;
    ArticleContainer.eventAddresses = addressesEvent;

    for (String address in addressesSpotlight.take(19).toList()) {
      Article? article = await Database.article().get(address);
      if (article != null) {
        spotlight.add(article);
      } else {
        print(
            'Error: Article with address $address is null, because the article could not be generated. The article was defined to should displayed at location with value: Spotlight');
      }
    }
    for (String address in addressesProject.take(19).toList()) {
      Article? article = await Database.article().get(address);
      if (article != null) {
        project.add(article);
      } else {
        print(
            'Error: Article with address $address is null, because the article could not be generated. The article was defined to should displayed at location with value: Project');
      }
    }
    for (String address in addressesEvent.take(19).toList()) {
      Article? article = await Database.article().get(address);
      if (article != null) {
        event.add(article);
      } else {
        print(
            'Error: Article with address $address is null, because the article could not be generated. The article was defined to should displayed at location with value: Event');
      }
    }
    ArticleContainer.spotlight = spotlight;
    ArticleContainer.projects = project;
    ArticleContainer.events = event;
  }
}
