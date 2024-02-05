import 'package:flutter/material.dart';
import 'package:netflix/core/costant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.appbarText});
  final String appbarText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sizedWidthT,
        Text(
          appbarText,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.cast),
        sizedWidthT,
        Image.asset('assets/images/home_icon.png', height: 33),
        sizedWidthT
      ],
    );
  }
}
