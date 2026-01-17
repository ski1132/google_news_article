import 'package:get/get.dart';

class LanguageLocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': en, 'th_TH': th};

  Map<String, String> en = {
    "latest": "Latest",
    "world": "World",
    "business": "Business",
    "entertainment": "Entertainment",
    "health": "Health",
    "science": "Science",
    "sport": "Sport",
    "technology": "Technology",
  };

  Map<String, String> th = {
    "latest": "ล่าสุด",
    "world": "โลก",
    "business": "ธุรกิจ",
    "entertainment": "บันเทิง",
    "health": "สุขภาพ",
    "science": "วิทยาศาสตร์",
    "sport": "กีฬา",
    "technology": "เทคโนโลยี",
  };
}
