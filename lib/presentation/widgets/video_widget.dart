import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
              color: colorBlue,
              borderRadius: borderRadius10,
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://tse3.mm.bing.net/th?id=OIP.WwU-X-gMkh0TGnBc0M0_6QHaEC&pid=Api&P=0&h=180'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: CircleAvatar(
            backgroundColor: colorBlack.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_rounded,
                size: 19,
                color: colorWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
