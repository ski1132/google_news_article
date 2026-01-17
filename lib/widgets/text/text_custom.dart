import 'package:flutter/widgets.dart';
import 'package:google_news_article/styles/style_constants.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int? maxLine;
  final bool softWrap;
  final TextOverflow? textOverflow;

  const TextCustom(
    this.text, {
    super.key,
    this.style = StyleConstants.textBlack20,
    this.textAlign = TextAlign.center,
    this.maxLine,
    this.softWrap = true,
    this.textOverflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    final originSize = style.fontSize ?? 0;
    const addSize = 0;
    return Text(
      text,
      style: style.copyWith(fontSize: originSize + addSize),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: textOverflow,
      maxLines: maxLine,
    );
  }
}
