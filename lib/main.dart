import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contacts App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
