import 'package:flutter/material.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/core/string.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:shimmer/shimmer.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, required this.url});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        url == null
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade900.withOpacity(0.9),
                highlightColor: colorGrey.shade800,
                child: Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: colorWhite,
                  ),
                ),
              )
            : Container(
                width: double.infinity,
                height: 600,
                // color: colorBlue,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                        image: NetworkImage('$imageAppendUrl$url'),
                        fit: BoxFit.cover)),
              ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const btnMainWidget(iconData: Icons.add, title: 'My List'),
              playButton(),
              const btnMainWidget(iconData: Icons.info_outline, title: 'Info'),
            ],
          ),
        ),
        const Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Emotional',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                ' * Romantic',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                ' * Drama',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }

  TextButton playButton() {
    return TextButton.icon(
      style: TextButton.styleFrom(
          backgroundColor: colorWhite,
          iconColor: colorBlack,
          foregroundColor: colorBlack),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
