import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_contacts_app/models/contact_model.dart';
import 'package:new_contacts_app/utils/app_assets.dart';
import 'package:new_contacts_app/utils/app_colors.dart';
import 'package:new_contacts_app/utils/app_styles.dart';

class ContactCardWidget extends StatelessWidget {
  final ContactModel contact;
  final Function deleteContactByIndex;

  String trimString(String input) {
    if (input.length > 16) {
      return '${input.substring(0, 16)}..';
    }
    return input;
  }

  const ContactCardWidget({
    super.key,
    required this.contact,
    required this.deleteContactByIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                contact.imageFile == null
                    ? Lottie.asset(AppAnimations.user)
                    : ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.file(
                          contact.imageFile!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    contact.userName,
                    style: AppStyles.cardUserNameTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(AppIcons.emailIcon, height: 16, width: 20),
                    const SizedBox(width: 8),
                    Text(
                      trimString(contact.email),
                      style: AppStyles.cardContentTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(AppIcons.phoneIcon, height: 20, width: 20),
                    const SizedBox(width: 8),
                    Text(
                      '+2${contact.phone}',
                      style: AppStyles.cardContentTextStyle,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteContactByIndex();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete, color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'Delete',
                        style: AppStyles.cardContentTextStyle
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
