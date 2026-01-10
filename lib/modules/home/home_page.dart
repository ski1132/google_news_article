import 'package:flutter/material.dart';
import 'package:google_news_article/controllers/home/home_controller.dart';
import 'package:google_news_article/widgets/base_view/base_view.dart';
import 'package:google_news_article/widgets/text/text_custom.dart';

class HomePage extends BaseView<HomeController> {
  HomePage({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [TextCustom('Hello World')],
      ),
    );
  }
}
