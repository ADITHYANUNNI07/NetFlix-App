// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_card_title.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBlack,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, isScroll, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const BackgroundCard(),
                      MainTitleCardWidget(
                          size: size, title: 'Released in the Past Year'),
                      sizedHeghitT,
                      MainTitleCardWidget(size: size, title: 'Trending Now'),
                      sizedHeghitT,
                      NumberCardTitleWidget(size: size),
                      sizedHeghitT,
                      MainTitleCardWidget(size: size, title: 'Tense Dramas'),
                      sizedHeghitT,
                      MainTitleCardWidget(
                          size: size, title: 'South Indian Cinema'),
                      sizedHeghitT,
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(microseconds: 1200),
                          width: double.infinity,
                          height: 90,
                          color: colorBlack.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://seeklogo.com/images/N/netflix-n-logo-0F1ED3EBEB-seeklogo.com.png',
                                      width: 50,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      size: 30,
                                    ),
                                    sizedWidthT,
                                    Image.asset('assets/images/home_icon.png',
                                        height: 35),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'TV Shows',
                                      style: ktextStyle,
                                    ),
                                    Text(
                                      'Movies',
                                      style: ktextStyle,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Categories',
                                          style: ktextStyle,
                                        ),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : sizedHeghitT
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class btnMainWidget extends StatelessWidget {
  const btnMainWidget({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, size: 35),
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
