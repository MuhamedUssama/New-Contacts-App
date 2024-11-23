import 'package:flutter/material.dart';
import 'package:new_contacts_app/models/contact_model.dart';

import 'contact_card_widget.dart';

class ScreenContacts extends StatelessWidget {
  final List<ContactModel> contacts;
  final Function onContactDeleteClicked;

  const ScreenContacts({
    super.key,
    required this.contacts,
    required this.onContactDeleteClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                return ContactCardWidget(
                  contact: contacts[index],
                  deleteContactByIndex: () {
                    onContactDeleteClicked(index);
                  },
                );
              },
              itemCount: contacts.length,
            ),
          ),
        ],
      ),
    );
  }
}
