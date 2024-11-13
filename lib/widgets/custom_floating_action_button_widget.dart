import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  const CustomFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: true,
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Delete',
            backgroundColor: AppColors.red,
            child: const Icon(
              Icons.delete_rounded,
              color: AppColors.white,
              size: 28,
            ),
          ),
        ),
        const Visibility(visible: true, child: SizedBox(height: 8)),
        Visibility(
          visible: true,
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            backgroundColor: AppColors.white,
            child: const Icon(
              Icons.add,
              color: AppColors.primaryColor,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
