import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  final String? backdropPath;
  final String movieName;
  final String description;
  const EveryOneWatchingWidget({
    super.key,
    required this.backdropPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedHeghitT,
        MainTitle(title: movieName),
        sizedHeghitT,
        Text(
          description,
          style: const TextStyle(
              fontSize: 17, color: colorGrey, fontWeight: FontWeight.bold),
        ),
        sizedHeghitT20,
        VideoPlayerWidget(url: backdropPath),
        sizedHeghitT,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            VideoBtnNewAndHotWidget(icon: Icons.send, title: 'Share'),
            sizedWidthT15,
            VideoBtnNewAndHotWidget(icon: CupertinoIcons.add, title: 'My List'),
            sizedWidthT15,
            VideoBtnNewAndHotWidget(
                icon: CupertinoIcons.play_arrow_solid, title: 'Play'),
            sizedWidthT15
          ],
        ),
        Row(
          children: [
            Image.asset('assets/images/logonetflix-removebg-preview.png',
                height: 30),
            sizedWidthT,
            const Text(
              'S E R I E S',
              style: TextStyle(color: colorWhite, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}

class VideoBtnNewAndHotWidget extends StatelessWidget {
  const VideoBtnNewAndHotWidget({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(
          title,
          style: const TextStyle(color: colorGrey),
        )
      ],
    );
  }
}
