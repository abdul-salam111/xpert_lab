import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cachednetworkimage({String? url}) {
  return CachedNetworkImage(
    imageUrl: url!,
  
    errorWidget: (context, url, error) => const Icon(Icons.error),
    height: 40.h,
    width: 40.h,
    fit: BoxFit.cover,
  );
}
