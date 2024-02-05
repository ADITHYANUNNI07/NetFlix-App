import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorBlack,
      body: SafeArea(child: Center(child: Text('New & Hot'))),
    );
  }
}
