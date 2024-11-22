import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  final bool isAddButtonVisible;
  final bool isDeleteButtonVisible;
  final Function showAddContact;
  final Function deleteContact;

  const CustomFloatingActionButtonWidget({
    super.key,
    required this.showAddContact,
    required this.isAddButtonVisible,
    required this.isDeleteButtonVisible,
    required this.deleteContact,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: isDeleteButtonVisible,
          child: FloatingActionButton(
            onPressed: () {
              deleteContact();
            },
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
          visible: isAddButtonVisible,
          child: FloatingActionButton(
            onPressed: () {
              showAddContact(context);
            },
            tooltip: 'Add Contact',
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
