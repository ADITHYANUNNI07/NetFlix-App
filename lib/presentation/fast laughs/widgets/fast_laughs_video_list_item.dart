// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:netflix/application/fast%20laughs/fast_laughs_bloc.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/core/string.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';
import 'package:netflix/presentation/fast%20laughs/screen_fast_laughs.dart';

class VideoListItemsWidgets extends StatelessWidget {
  final int index;
  final String videoUrl;
  const VideoListItemsWidgets(
      {super.key, required this.index, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    print(posterPath);
    return Stack(
      children: [
        VideoPlayerFastLaugh(videoUrl: videoUrl, onStateChanged: (bool) {}),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                //left side
                CircleAvatar(
                  radius: 25,
                  backgroundColor: colorBlack.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_rounded,
                      size: 27,
                      color: colorWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: posterPath != null
                      ? NetworkImage('$imageAppendUrl$posterPath')
                      : null,
                ),
                sizedHeghitT20,
                ValueListenableBuilder(
                  valueListenable: likedVideosIdsNotifier,
                  builder:
                      (BuildContext c, Set<int> likedVideosIds, Widget? child) {
                    if (likedVideosIds.contains(index)) {
                      return InkWell(
                        onTap: () {
                          //BlocProvider.of<FastLaughsBloc>(context).add(UnlikedVideo(id: index));
                          likedVideosIdsNotifier.value.remove(index);
                          likedVideosIdsNotifier.notifyListeners();
                        },
                        child: const VideoActionsList(
                            icon: Icons.favorite, title: 'Liked'),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        //BlocProvider.of<FastLaughsBloc>(context).add(LikedVideo(id: index));
                        likedVideosIdsNotifier.value.add(index);
                        likedVideosIdsNotifier.notifyListeners();
                      },
                      child: const VideoActionsList(
                          icon: Icons.emoji_emotions, title: 'LOL'),
                    );
                  },
                ),
                const VideoActionsList(icon: Icons.add, title: 'My List'),
                VideoActionsList(
                  icon: Icons.share,
                  title: 'Share',
                  onTap: () {
                    final movieName = VideoListItemInheritedWidget.of(context)
                        ?.movieData
                        .moiveTitle;
                    if (movieName != null) {
                      Share.share(movieName);
                    }
                  },
                ),
                const VideoActionsList(icon: Icons.play_arrow, title: 'Play')
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsList extends StatelessWidget {
  const VideoActionsList(
      {super.key, required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          sizedHeghitT20
        ],
      ),
    );
  }
}

class VideoPlayerFastLaugh extends StatefulWidget {
  const VideoPlayerFastLaugh(
      {super.key, required this.videoUrl, required this.onStateChanged});
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  @override
  State<VideoPlayerFastLaugh> createState() => _VideoPlayerFastLaughState();
}

late VideoPlayerController _videoPlayerController;

class _VideoPlayerFastLaughState extends State<VideoPlayerFastLaugh> {
  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController))
          : const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
