import 'package:cached_network_image/cached_network_image.dart';
import 'package:devy_boiler_plate/dev/logging/logger.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double? width, height;
  final bool isPrefix;

  const ImageWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.isPrefix = true,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.cover,
      imageUrl: isPrefix ? "" : url,
      placeholder: (context, url) {
        return const Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator()));
      },
      errorWidget: (context, url, error) {
        DevLogger().logStackError(error.toString());
        return const Icon(Icons.error);
      },
    );
  }
}
