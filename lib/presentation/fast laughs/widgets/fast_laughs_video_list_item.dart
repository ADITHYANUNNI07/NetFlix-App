import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';

class VideoListItemsWidgets extends StatelessWidget {
  final int index;
  const VideoListItemsWidgets({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
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
        const Positioned(
          right: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg'),
                ),
                sizedHeghitT20,
                VideoActionsList(icon: Icons.emoji_emotions, title: 'LOL'),
                VideoActionsList(icon: Icons.add, title: 'My List'),
                VideoActionsList(icon: Icons.share, title: 'Share'),
                VideoActionsList(icon: Icons.play_arrow, title: 'Play')
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsList extends StatelessWidget {
  const VideoActionsList({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
