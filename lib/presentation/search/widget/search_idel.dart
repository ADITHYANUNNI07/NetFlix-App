import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

final imageUrl = [
  "https://tse3.mm.bing.net/th?id=OIP.WwU-X-gMkh0TGnBc0M0_6QHaEC&pid=Api&P=0&h=180",
  "https://media.themoviedb.org/t/p/w500_and_h282_face/e0M3WVJm4nBrAg0LbJq0gdKi3U7.jpg",
  "https://media.themoviedb.org/t/p/w500_and_h282_face/meyhnvssZOPPjud4F1CjOb4snET.jpg",
  "https://media.themoviedb.org/t/p/w500_and_h282_face/ehumsuIBbgAe1hg343oszCLrAfI.jpg",
  "https://media.themoviedb.org/t/p/w500_and_h282_face/r9oTasGQofvkQY5vlUXglneF64Z.jpg",
];

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitleWidget(title: 'Top Searches'),
        sizedHeghitT,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchIteams(),
            separatorBuilder: (context, index) => sizedHeghitT20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchIteams extends StatelessWidget {
  const TopSearchIteams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Container(
            width: size * 0.35,
            height: 65,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl[0]))),
          ),
          sizedWidthT,
          const Expanded(
            child: Text(
              "Movie Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const CircleAvatar(
            backgroundColor: colorWhite,
            radius: 25,
            child: CircleAvatar(
              backgroundColor: colorBlack,
              radius: 23,
              child: Center(
                child: Icon(
                  CupertinoIcons.play_fill,
                  color: colorWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
