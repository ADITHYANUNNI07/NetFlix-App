import 'package:flutter/material.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/core/string.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
    required this.size,
    required this.imageUrl,
  });

  final Size size;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: size.width * 0.43,
        height: size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: borderRadius10,
            image: DecorationImage(
                image: NetworkImage('$imageAppendUrl$imageUrl'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
