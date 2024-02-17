import 'package:flutter/material.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/domain/home/models/home/home_repo.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberCardTitleWidget extends StatelessWidget {
  const NumberCardTitleWidget({
    super.key,
    required this.size,
    required this.list,
  });
  final List<HomeData> list;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV Shows In India Today'),
        sizedHeghitT,
        LimitedBox(
          maxHeight: size.height * 0.3,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) =>
                    NumberCard(index: index, url: list[index].posterPath ?? ''),
              )),
        ),
      ],
    );
  }
}
