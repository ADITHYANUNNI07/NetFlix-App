import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast%20laughs/fast_laughs_bloc.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/domain/downloads/models/model_download.dart';
import 'package:netflix/presentation/fast%20laughs/widgets/fast_laughs_video_list_item.dart';

class FastLaughsScreen extends StatelessWidget {
  const FastLaughsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughsBloc>(context).add(const Initialize());
    });
    return Scaffold(
      backgroundColor: colorBlack,
      body: SafeArea(
        child: BlocBuilder<FastLaughsBloc, FastLaughsState>(
          builder: (context, state) {
            if (state.isloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(child: Text('Error'));
            } else if (state.videoList.isEmpty) {
              return const Center(child: Text('Video list Empty'));
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videoList.length, (index) {
                  return VideoListItemInheritedWidget(
                      widget: VideoListItemsWidgets(
                        videoUrl: dummyVideoUrls[index % dummyVideoUrls.length],
                        key: Key(index.toString()),
                        index: index,
                      ),
                      movieData: state.videoList[index]);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}
