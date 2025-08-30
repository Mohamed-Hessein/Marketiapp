import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgIcon extends StatelessWidget {
  final dynamic assetName;
  final dynamic size;
  final Color? color;

  const AppSvgIcon({super.key, this.size, this.color, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      theme: SvgTheme(
        currentColor: color ?? IconTheme.of(context).color ?? Colors.black,
      ),
    );
  }
}
