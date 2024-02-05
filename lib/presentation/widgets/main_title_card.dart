import 'package:flutter/material.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        sizedHeghitT,
        LimitedBox(
          maxHeight: size.height * 0.3,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => MainCardWidget(size: size),
              )),
        )
      ],
    );
  }
}
