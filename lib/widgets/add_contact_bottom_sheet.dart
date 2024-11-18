import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AddContactBottomSheet extends StatelessWidget {
  const AddContactBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.58,
      padding: const EdgeInsets.all(20),
    );
  }
}
