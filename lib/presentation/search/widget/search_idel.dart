import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/core/string.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';
import 'package:shimmer/shimmer.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading || state.idelList.isEmpty) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const TopSearchIteams(
                      title: null,
                      imageUrl: null,
                    );
                  },
                  separatorBuilder: (context, index) => sizedHeghitT20,
                  itemCount: 15,
                );
              } else if (state.isError) {
                return const Center(child: Text('Error while getting data'));
              }
              final filteredList = state.idelList
                  .where((movie) => movie.moiveTitle?.isNotEmpty ?? false)
                  .toList();
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = filteredList[index];
                  return TopSearchIteams(
                      title: movie.moiveTitle ?? 'No title provided',
                      imageUrl: '$imageAppendUrl${movie.backdropPath}');
                },
                separatorBuilder: (context, index) => sizedHeghitT20,
                itemCount: filteredList.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchIteams extends StatelessWidget {
  const TopSearchIteams({
    super.key,
    required this.title,
    required this.imageUrl,
  });
  final String? title;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          imageUrl == null
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade900.withOpacity(0.9),
                  highlightColor: colorGrey.shade800,
                  child: Container(
                    width: size * 0.35,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade900.withOpacity(0.9),
                    ),
                  ),
                )
              : Container(
                  width: size * 0.35,
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade900.withOpacity(0.9),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(imageUrl!))),
                ),
          sizedWidthT,
          Expanded(
            child: title != null
                ? Text(
                    title!.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade900.withOpacity(0.9),
                        highlightColor: colorGrey.shade800,
                        child: Container(
                            height: 20,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade900.withOpacity(0.9),
                            )),
                      ),
                      const SizedBox(height: 5),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade900.withOpacity(0.9),
                        highlightColor: colorGrey.shade800,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade900.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          title == null ? sizedWidthT : Container(),
          title == null
              ? const SizedBox()
              : const CircleAvatar(
                  backgroundColor: colorWhite,
                  radius: 20,
                  child: CircleAvatar(
                    backgroundColor: colorBlack,
                    radius: 18,
                    child: Icon(CupertinoIcons.play_fill,
                        color: colorWhite, size: 20),
                  ),
                )
        ],
      ),
    );
  }
}
