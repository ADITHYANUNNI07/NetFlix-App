import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CupertinoSearchTextField(
              backgroundColor: colorGrey.withOpacity(0.5),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: colorGrey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: colorGrey,
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sizedHeghitT,
          //const Expanded(child: SearchIdleWidget())
          const Expanded(child: SearchResultWidget())
        ],
      )),
    );
  }
}
