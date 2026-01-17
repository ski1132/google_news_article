import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/generated/locale_keys.g.dart';
import 'package:google_news_article/models/article_item_model.dart';
import 'package:google_news_article/widgets/base_view/base_view.dart';
import 'package:google_news_article/widgets/image_view/image_url_widget.dart';
import 'package:google_news_article/widgets/text/text_custom.dart';
import 'package:sizer/sizer.dart';

class HomePage extends BaseView<HomeController> {
  HomePage({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [TextCustom(LocaleKeys.app_name.tr)],
      ),
    );
  }

  //widget item
  Widget _articleItem(ArticleItemModel articleItemModel) {
    return Card.outlined(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFEDF7FD)),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Row(
        children: [
          ImageUrlWidget('', width: 30.w, height: 30.w),
          Expanded(child: Column(children: [TextCustom(''), TextCustom('')])),
        ],
      ),
    );
  }
}
