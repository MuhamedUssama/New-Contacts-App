import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/placeholder_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: contacts.isEmpty
          ? const PlaceholderWidget()
          : const Column(
              children: [],
            ),
    );
  }
}
