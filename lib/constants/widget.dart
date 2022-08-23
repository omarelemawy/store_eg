import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'color_constans.dart';

customCachedNetworkImage({String? url, BuildContext? context, BoxFit? boxFit,double? height,double? width,}) {
  try {
    if (url == null || url == '') {
      return Container();
    } else {
      return Container(
        width: MediaQuery.of(context!).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
          imageUrl: url,
          fit: (boxFit) ?? BoxFit.contain,
          height: height,
          width: width,
          placeholder: (context, url) => Center(
            child: SpinKitChasingDots(
              color: customColor,
              size: 20,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
            : Icon(
          Icons.image,
          color: customColor,
        ),
      );
    }
  } catch (e) {
    print(e.toString());
  }
}