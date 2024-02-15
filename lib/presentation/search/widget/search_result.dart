import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/core/string.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';
import 'package:shimmer/shimmer.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitleWidget(title: 'Movies & TV'),
        sizedHeghitT,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey.shade900.withOpacity(0.9),
                  highlightColor: Colors.grey.shade800,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    shrinkWrap: true,
                    childAspectRatio: 1 / 1.5,
                    children: List.generate(20, (index) {
                      return SearchResultMainCard(
                        imageUrl:
                            '$imageAppendUrl${state.searchResultList[index].posterPath}',
                      );
                    }),
                  ));
            }
            final filteredList = state.searchResultList
                .where((movie) => movie.posterPath?.isNotEmpty ?? false)
                .toList();
            return GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              shrinkWrap: true,
              childAspectRatio: 1 / 1.5,
              children: List.generate(filteredList.length, (index) {
                return SearchResultMainCard(
                  imageUrl: '$imageAppendUrl${filteredList[index].posterPath}',
                );
              }),
            );
          },
        ))
      ],
    );
  }
}

// class SearchResultMainCard extends StatelessWidget {
//   const SearchResultMainCard({super.key, required this.imageUrl});
//   final String imageUrl;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//           image: DecorationImage(
//               image: NetworkImage(imageUrl), fit: BoxFit.cover)),
//     );
//   }
// }

class SearchResultMainCard extends StatelessWidget {
  const SearchResultMainCard({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade900.withOpacity(0.9),
                  highlightColor: colorGrey.shade800,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            )
          : Shimmer.fromColors(
              baseColor: Colors.grey.shade900.withOpacity(0.9),
              highlightColor: colorGrey.shade800,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
    );
  }
}
