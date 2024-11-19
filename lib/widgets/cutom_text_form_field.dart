import 'package:flutter/material.dart';
import 'package:new_contacts_app/utils/app_colors.dart';
import 'package:new_contacts_app/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.white,
      style: AppStyles.font16WhiteMudium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.hintTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.white),
        ),
      ),
    );
  }
}
