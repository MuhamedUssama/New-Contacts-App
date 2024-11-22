import 'package:flutter/material.dart';
import 'package:new_contacts_app/models/contact_model.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../widgets/add_contact_bottom_sheet.dart';
import '../widgets/custom_floating_action_button_widget.dart';
import '../widgets/placeholder_widget.dart';
import '../widgets/screen_contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
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
          : ScreenContacts(
              contacts: contacts,
              onContactDeleteClicked: deleteContactByIndex,
            ),
      floatingActionButton: CustomFloatingActionButtonWidget(
        isAddButtonVisible: contacts.length < 6,
        isDeleteButtonVisible: contacts.isNotEmpty,
        showAddContact: showContactBottomSheet,
        deleteContact: deleteContact,
      ),
    );
  }

  void showContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => AddContactBottomSheet(
        contacts: contacts,
        onContactAdded: () {
          setState(() {});
        },
      ),
    );
  }

  void deleteContact() {
    contacts.removeLast();
    setState(() {});
  }

  void deleteContactByIndex(int index) {
    contacts.removeAt(index);
    setState(() {});
  }
}
