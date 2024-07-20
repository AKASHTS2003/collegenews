import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.height = 125,
    this.borderRadius = 20,
    required this.width,
    this.imageAsset = '',
    this.padding,
    this.margin,
    this.child,
    required this.imageUrl,
  });

  final double width;
  final double height;
  final String imageAsset;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: _getImageProvider(),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }

  ImageProvider<Object> _getImageProvider() {
    if (imageAsset.isNotEmpty) {
      return AssetImage(imageAsset);
    } else {
      return NetworkImage(imageUrl);
    }
  }
}
