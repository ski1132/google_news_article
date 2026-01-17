// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/color_constants.dart';

class ImageUrlWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const ImageUrlWidget(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    try {
      if (url.isEmpty) {
        return imageDefaultEmpty();
      }
      return CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
        imageBuilder: (context, imageProvider) => ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image(image: imageProvider, fit: fit),
        ),
        placeholder: (context, url) => FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (c, s) => s.connectionState == ConnectionState.done
              ? imageDefaultEmpty()
              : const Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.colorWhite,
                  ),
                ),
        ),
        errorWidget: (context, url, error) => imageDefaultEmpty(),
        fit: BoxFit.fill,
      );
    } catch (e) {
      return imageDefaultEmpty();
    }
  }

  Widget imageDefaultEmpty() {
    return SizedBox(
      width: width,
      height: height,
      child: Icon(
        Icons.hide_image,
        color: ColorConstants.colorGrey2,
        size: 10.w,
      ),
    );
  }
}
