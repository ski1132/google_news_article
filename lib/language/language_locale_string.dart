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
    "other_news": "Other News",
    'previous': 'Previous',
    'next': 'Next',
    'no_data': 'No Data',
    'exceed_limit':
        'You have exceeded your request limit. Please upgrade your plan.',
    'saved_articles': 'Saved articles',
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
    "other_news": "ข่าวอื่นๆ",
    'previous': 'ก่อนหน้า',
    'next': 'ถัดไป',
    'no_data': 'ไม่พบข้อมูล',
    'exceed_limit': 'คุณส่งคำขอมาเกินลิมิตที่ตั้งไว้แล้ว กรุณาอัพเกรดแพลน',
    'saved_articles': 'บทความที่บันทึกไว้',
  };
}
