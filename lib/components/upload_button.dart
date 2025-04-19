import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    this.size = 40.0,
    this.iconSize = 20.0,
    this.borderRadius = 12.0,
    this.borderWidth = 1.5,
    this.borderColor,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.iconPath = 'lib/assets/images/uploader.svg', // default path
    this.onTap,
  });

  final double size;
  final double iconSize;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final Color? iconColor;
  final Color backgroundColor;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = borderColor ?? Colors.grey.shade400;
    final effectiveIconColor = iconColor ?? Colors.grey.shade700;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          border: Border.all(color: effectiveBorderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
            color: effectiveIconColor,
          ),
        ),
      ),
    );
  }
}
