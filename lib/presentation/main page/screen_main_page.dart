import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/presentation/downloads/screen_download.dart';
import 'package:netflix/presentation/fast%20laughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main%20page/widget/bottom_nav.dart';
import 'package:netflix/presentation/new%20&%20hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({super.key});

  final pages = [
    const HomeScreen(),
    const NewAndHotScreen(),
    const FastLaughsScreen(),
    const SearchScreen(),
    DownloadsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack,
      body: ValueListenableBuilder<int>(
        valueListenable: indexChangeNotifier,
        builder: (context, index, child) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigatorWidget(),
    );
  }
}
