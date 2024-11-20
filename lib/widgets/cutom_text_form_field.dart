import 'package:flutter/material.dart';
import 'package:new_contacts_app/utils/app_colors.dart';
import 'package:new_contacts_app/utils/app_styles.dart';

typedef ValidationFunction = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValidationFunction validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.white,
      style: AppStyles.font16WhiteMudium,
      validator: validator,
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
