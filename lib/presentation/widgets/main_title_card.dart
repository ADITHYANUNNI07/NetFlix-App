import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:shimmer/shimmer.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget(
      {super.key,
      required this.size,
      required this.title,
      this.list,
      this.isloading = false});
  final List<dynamic>? list;
  final Size size;
  final String title;
  final bool isloading;
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
                list == null ? 10 : list!.length,
                (index) => list == null
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade900.withOpacity(0.9),
                        highlightColor: colorGrey.shade800,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: size.width * 0.43,
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: borderRadius10,
                            ),
                          ),
                        ),
                      )
                    : MainCardWidget(
                        size: size,
                        imageUrl:
                            list != null ? list![index].posterPath ?? '' : '',
                      ),
              )..shuffle()),
        )
      ],
    );
  }
}
