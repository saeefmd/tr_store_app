import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    Key? key,
    required this.onTap,
    this.centerWidget,
    this.suffixWidget,
    this.prefixWidget,
    this.width,
    this.height,
    this.backgroundColor,
    this.radius,
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.margin
  }) : super(key: key);

  final Function() onTap;

  final Widget? centerWidget;
  final Widget? suffixWidget;
  final Widget? prefixWidget;

  final double? radius;
  final double? borderWidth;
  final Color? borderColor;

  final Color? backgroundColor;

  final double? height;
  final double? width;

  final double? elevation;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 8),
        side: BorderSide(
          color: borderColor ?? AppColors.primaryPurple,
          width: borderWidth ?? 1
        )
      ),
      margin: margin ?? EdgeInsets.zero,
      color: backgroundColor ?? Colors.white,
      elevation: elevation ?? 2,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primaryPurple.withOpacity(0.3),
        highlightColor: AppColors.primaryPurple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(radius ?? 8),
        child: Container(
          height: height ?? 56,
          width: width ?? MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prefixWidget ?? Container(),
              centerWidget ?? Container(),
              suffixWidget ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}
