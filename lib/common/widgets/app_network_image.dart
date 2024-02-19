import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    Key? key,
    required this.url,
    this.errorIcon,
    this.boxFit
  }) : super(key: key);

  final String url;
  final Icon? errorIcon;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (context, url, error) => errorIcon ?? const Icon(
        Icons.error,
        size: 20,
      ),
      placeholder: (context, url) => Center(
          child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.grey.shade300,
              )
          )
      ),
      fit: boxFit ?? BoxFit.none,
    );
  }
}
