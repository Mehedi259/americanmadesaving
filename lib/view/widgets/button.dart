import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 52,
      decoration: BoxDecoration(
        gradient: !isOutlined
            ? const LinearGradient(
          colors: [Color(0xFF5B9FD8), Color(0xFF8E5BA8), Color(0xFFE04848)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
            : null,
        border: isOutlined ? Border.all(color: Colors.grey.shade300) : null,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        boxShadow: !isOutlined
            ? [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          child: Center(
            child: isLoading
                ? SizedBox(
              width: 24,
              height: 24,
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
                : Text(
              text,
              style: TextStyle(
                color: textColor ?? (isOutlined ? Colors.black87 : Colors.white),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}