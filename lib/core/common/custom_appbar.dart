import 'package:flutter/material.dart';
import 'package:skilllink/core/themes/app_colors.dart'; // Assuming you have this

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final TextStyle? titleTextStyle;
  final Widget? leading; // Added leading widget

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.titleTextStyle,
    this.leading, // Added to constructor
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? (showBackButton // Use leading if provided, otherwise use default back button
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
              color: foregroundColor ?? AppColors.blue, // Default color
            )
          : null),
      title: Text(
        title,
        style: titleTextStyle ?? // Use titleTextStyle if provided
            const TextStyle(
              // Default title style
              color: AppColors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
      ),
      actions: actions,
      backgroundColor: backgroundColor ?? AppColors.white, // Default background
      foregroundColor: foregroundColor ??
          AppColors
              .blue, // Default foreground color for icons and text,
      elevation: elevation ?? 1.0, // Default elevation
      centerTitle: true,
    );
  }
}