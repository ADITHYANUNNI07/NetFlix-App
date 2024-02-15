import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/core/string.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String? url;
  const VideoPlayerWidget({
    super.key,
    required this.url,
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
              image: url == null
                  ? null
                  : DecorationImage(
                      image: NetworkImage('$imageAppendUrl$url'),
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
