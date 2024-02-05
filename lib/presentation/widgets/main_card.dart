import 'package:flutter/material.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: size.width * 0.43,
        height: size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: borderRadius10,
            image: const DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
