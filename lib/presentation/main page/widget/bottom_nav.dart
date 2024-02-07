import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: indexChangeNotifier,
      builder: (context, newIndex, _) {
        return BottomNavigationBar(
            elevation: 0,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: colorBlack,
            currentIndex: newIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: colorGrey.withOpacity(0.6),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme:
                IconThemeData(color: colorGrey.withOpacity(0.6)),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections_outlined), label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_downward), label: 'Downloads')
            ]);
      },
    );
  }
}
