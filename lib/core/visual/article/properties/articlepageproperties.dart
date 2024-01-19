import 'package:shutter/core/visual/article/properties/children/articlepageattachments.dart';

class ArticlePageProperties {
  ArticlePageAttachments? attachments;
  final bool openPageOnClick;

  ArticlePageProperties({
    required this.openPageOnClick,
    this.attachments,
  });

  ArticlePageAttachments? get getAttachments => attachments;

  bool get getOpenPageOnClick => openPageOnClick;

  Map<String, dynamic> toJson() {
    return {
      'attachments': attachments?.toJson(),
      'openPageOnClick': openPageOnClick,
    };
  }
}
