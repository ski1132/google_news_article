// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../styles/color_constants.dart';
import '../../styles/value_constants.dart';
import '../../utils/enum_custom.dart';
import '../container/container_curved.dart';

class ImageUrlWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageErrorType? errorType;
  const ImageUrlWidget(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.errorType,
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
        imageBuilder: (context, imageProvider) =>
            errorType == ImageErrorType.league
            ? ContainerCurved(
                padding: const EdgeInsets.all(AppValues.padding2),
                backgroundColor: ColorConstants.colorWhite,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: fit),
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(AppValues.padding8),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: fit),
                  ),
                ),
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
    return Icon(
      Icons.hide_image,
      color: ColorConstants.colorGrey2,
      size: width,
    );
  }
}
