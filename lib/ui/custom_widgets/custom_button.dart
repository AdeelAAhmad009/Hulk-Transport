import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hulk_transport/core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.bgColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          side: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.ktbtnTextStyle.copyWith(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
