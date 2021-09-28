import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

enum AppImageSource { asset, network }

class AppImage extends StatelessWidget {
  final String source;
  final AlignmentGeometry alignment;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final String? package;
  AppImage.network(
    this.source, {
    Key? key,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.package,
  })  : _source = AppImageSource.network,
        super(key: key);

  AppImage.asset(
    this.source, {
    Key? key,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.package,
  })  : _source = AppImageSource.asset,
        super(key: key);

  final AppImageSource _source;

  @override
  Widget build(BuildContext context) {
    if (_source == AppImageSource.asset) {
      if (source.endsWith('.svg')) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: SvgPicture.asset(
            source,
            alignment: alignment,
            width: width,
            height: height,
            fit: fit,
            color: color,
            placeholderBuilder: (_) => placeholder(),
          ),
        );
      } else {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Image.asset(
            source,
            alignment: alignment,
            width: width,
            height: height,
            fit: fit,
            color: color,
            errorBuilder: (_, __, ___) => placeholder(),
            package: package,
          ),
        );
      }
    } else {
      if (source.endsWith('.svg')) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: SvgPicture.network(
            source,
            alignment: alignment,
            width: width,
            height: height,
            fit: fit,
            color: color,
            placeholderBuilder: (_) => placeholder(),
          ),
        );
      } else {
        return ClipRRect(
          borderRadius: borderRadius,
          child:
              //  Image.network(
              //   source,
              //   alignment: alignment,
              //   width: width,
              //   height: height,
              //   fit: fit,
              // color: color,
              // loadingBuilder: (_, __, ___) => placeholder(),
              // errorBuilder: (context, error, stackTrace) {
              //   print(error);
              //   print(stackTrace);
              //   return placeholder();
              // },
              // ),

              CachedNetworkImage(
            imageUrl: source,
            //alignment: alignment,
            width: width,
            height: height,
            fit: fit,
            color: color,

            placeholder: (_, __) => placeholder(),
            errorWidget: (_, __, ___) => placeholder(),
          ),
        );
      }
    }
  }

  Widget placeholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      direction: ShimmerDirection.ltr,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey[500],
      ),
    );
  }
}
