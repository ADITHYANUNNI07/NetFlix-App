// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/Home/home_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/hot%20&%20new/hot_and_new_bloc.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/domain/home/models/home/home_repo.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/number_card_title.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const LoadTrending());
      BlocProvider.of<HomeBloc>(context).add(const LoadTopTen());
      BlocProvider.of<HomeBloc>(context).add(const LoadRelesedPastYr());
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneWatching());
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
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
                      BlocBuilder<HotAndNewBloc, HotAndNewState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const BackgroundCard(url: null);
                          } else if (state.hasError) {
                            return const Center(
                              child: Text('Error'),
                            );
                          } else if (state.comingSoonList.isEmpty) {
                            return const BackgroundCard(url: null);
                          } else {
                            return BackgroundCard(
                                url: state.comingSoonList[5].posterPath ?? '');
                          }
                        },
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                        if (state.isLoading) {
                          return MainTitleCardWidget(
                            size: size,
                            title: 'Released in the Past Year',
                            isloading: true,
                          );
                        } else if (state.hasError) {
                          return const Center(
                            child: Text('Error'),
                          );
                        } else if (state.relesedList.isEmpty) {
                          return MainTitleCardWidget(
                            size: size,
                            title: 'Released in the Past Year',
                            isloading: true,
                          );
                        } else {
                          return MainTitleCardWidget(
                              list: state.relesedList,
                              size: size,
                              title: 'Released in the Past Year');
                        }
                      }),
                      sizedHeghitT,
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return MainTitleCardWidget(
                              size: size,
                              title: 'Trending Now',
                              isloading: true,
                            );
                          } else if (state.hasError) {
                            return const Center(
                              child: Text('Error'),
                            );
                          } else if (state.trendingList.isEmpty) {
                            return MainTitleCardWidget(
                              size: size,
                              title: 'Trending Now',
                              isloading: true,
                            );
                          } else {
                            List<HomeData> list = state.trendingList;

                            return MainTitleCardWidget(
                                size: size, title: 'Trending Now', list: list);
                          }
                        },
                      ),
                      sizedHeghitT,
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return MainTitleCardWidget(
                                size: size,
                                title: 'Top 10 TV Shows In India Today',
                                isloading: true);
                          } else if (state.hasError) {
                            return const Center(
                              child: Text('Error'),
                            );
                          } else if (state.topList.isEmpty) {
                            return MainTitleCardWidget(
                                size: size,
                                title: 'Top 10 TV Shows In India Today',
                                isloading: true);
                          } else {
                            return NumberCardTitleWidget(
                                size: size, list: state.topList);
                          }
                        },
                      ),
                      sizedHeghitT,
                      BlocBuilder<HotAndNewBloc, HotAndNewState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return MainTitleCardWidget(
                              isloading: false,
                              size: size,
                              title: 'Tense Dramas',
                            );
                          } else if (state.hasError) {
                            return const Center(
                              child: Text('Error'),
                            );
                          } else if (state.everyOneIsWatchingList.isEmpty) {
                            return MainTitleCardWidget(
                              isloading: false,
                              size: size,
                              title: 'Tense Dramas',
                            );
                          } else {
                            return MainTitleCardWidget(
                                size: size,
                                title: 'Tense Dramas',
                                list: state.everyOneIsWatchingList);
                          }
                        },
                      ),
                      sizedHeghitT,
                      BlocBuilder<DownloadsBloc, DownloadsState>(
                        builder: (context, state) {
                          if (state.isloading) {
                            return MainTitleCardWidget(
                              size: size,
                              title: 'South Indian Cinema',
                              isloading: true,
                            );
                          } else if (state.downloads == null) {
                            return MainTitleCardWidget(
                              size: size,
                              title: 'South Indian Cinema',
                              isloading: true,
                            );
                          } else {
                            return MainTitleCardWidget(
                                size: size,
                                title: 'South Indian Cinema',
                                list: state.downloads ?? []);
                          }
                        },
                      ),
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
                                    Image.asset(
                                      'assets/images/logonetflix-removebg-preview.png',
                                      width: 20,
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
