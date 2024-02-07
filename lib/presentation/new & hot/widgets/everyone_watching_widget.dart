import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedHeghitT,
        const MainTitle(title: 'Friends'),
        sizedHeghitT,
        const Text(
          'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence and her relationship Into a tailspin.',
          style: TextStyle(
              fontSize: 17, color: colorGrey, fontWeight: FontWeight.bold),
        ),
        sizedHeghitT20,
        const VideoPlayerWidget(),
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
