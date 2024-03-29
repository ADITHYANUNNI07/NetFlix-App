import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/core/string.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.url});
  final int index;
  final String url;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              height: size.height * 0.3,
            ),
            Container(
              width: size.width * 0.43,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  borderRadius: borderRadius10,
                  image: DecorationImage(
                      image: NetworkImage('$imageAppendUrl$url'),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          bottom: -30,
          left: -4,
          child: BorderedText(
            strokeColor: colorWhite,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 150,
                color: colorBlack.withOpacity(0.9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
