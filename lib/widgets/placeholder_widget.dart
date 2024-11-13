import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/animations/empty_list.json'));
  }
}
