import 'package:flutter/material.dart';

class SearchTextTitleWidget extends StatelessWidget {
  const SearchTextTitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
