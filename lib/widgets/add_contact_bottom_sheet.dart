import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_contacts_app/models/contact_model.dart';
import 'package:new_contacts_app/utils/app_assets.dart';
import 'package:new_contacts_app/utils/app_styles.dart';
import 'package:new_contacts_app/utils/image_picker_utils.dart';
import 'package:new_contacts_app/utils/validation.dart';

import '../utils/app_colors.dart';
import 'cutom_text_form_field.dart';

class AddContactBottomSheet extends StatefulWidget {
  final List<ContactModel> contacts;
  final VoidCallback onContactAdded;

  const AddContactBottomSheet({
    super.key,
    required this.contacts,
    required this.onContactAdded,
  });

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    String userName = 'User Name';
    String email = 'test@example.com';
    String phoneNumber = '+2000000000000';

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: pickedImage == null
                        ? Center(
                            child: GestureDetector(
                              onTap: () async {
                                File? tempImage =
                                    await ImagePickerUtils.galleryPicker();
                                if (tempImage != null) {
                                  pickedImage = tempImage;
                                }
                                setState(() {});
                              },
                              child: Lottie.asset(AppAnimations.imagePicker),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.file(pickedImage!, fit: BoxFit.fill),
                          ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: userNameController,
                        builder: (context, value, child) => Text(
                          value.text.isEmpty ? userName : value.text,
                          style: AppStyles.font16WhiteMudium,
                        ),
                      ),
                      const Divider(color: AppColors.white),
                      ValueListenableBuilder(
                        valueListenable: emailController,
                        builder: (context, value, child) => Text(
                          value.text.isEmpty ? email : value.text,
                          style: AppStyles.font16WhiteMudium,
                        ),
                      ),
                      const Divider(color: AppColors.white),
                      ValueListenableBuilder(
                        valueListenable: phoneNumberController,
                        builder: (context, value, child) => Text(
                          value.text.isEmpty ? phoneNumber : value.text,
                          style: AppStyles.font16WhiteMudium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Enter User Name',
                    controller: userNameController,
                    validator: (value) {
                      return Validation.notEmptyFieldValidator(
                        value,
                        'Please enter a user name',
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: 'Enter User Email',
                    controller: emailController,
                    validator: (value) {
                      return Validation.emailValidator(value);
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: 'Enter User Phone',
                    controller: phoneNumberController,
                    validator: (value) {
                      return Validation.notEmptyFieldValidator(
                        value,
                        'Please enter your phone',
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: addContact,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  fixedSize: Size(width, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              child: const Text(
                'Enter User',
                style: AppStyles.elevatedButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addContact() {
    if (formKey.currentState!.validate()) {
      widget.contacts.add(
        ContactModel(
          userName: userNameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          imageFile: pickedImage,
        ),
      );
      widget.onContactAdded();
      Navigator.pop(context);
    }
  }
}
