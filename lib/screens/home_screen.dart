import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../widgets/add_contact_bottom_sheet.dart';
import '../widgets/custom_floating_action_button_widget.dart';
import '../widgets/placeholder_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> contacts = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(AppImages.logo),
        ),
        leadingWidth: width * 0.3,
      ),
      body: contacts.isEmpty
          ? const PlaceholderWidget()
          : const Column(
              children: [],
            ),
      floatingActionButton: CustomFloatingActionButtonWidget(
        showAddContact: showContactBottomSheet,
      ),
    );
  }

  showContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => const AddContactBottomSheet(),
    );
  }
}
