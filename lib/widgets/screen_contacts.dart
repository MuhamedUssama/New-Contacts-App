import 'package:flutter/material.dart';
import 'package:new_contacts_app/models/contact_model.dart';

import 'contact_card_widget.dart';

class ScreenContacts extends StatelessWidget {
  final double height;
  final double width;
  final List<ContactModel> contacts;

  const ScreenContacts({
    super.key,
    required this.height,
    required this.width,
    required this.contacts,
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
                  height: height,
                  width: width,
                  contact: contacts[index],
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
