import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/domain/core/debounce/debounce.dart';
import 'package:netflix/presentation/search/widget/search_idel.dart';
import 'package:netflix/presentation/search/widget/search_result.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final debouncer = Debouncer(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
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
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  });
                },
              ),
            ),
            sizedHeghitT,
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.searchResultList.isEmpty
                      ? const SearchIdleWidget()
                      : const SearchResultWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
