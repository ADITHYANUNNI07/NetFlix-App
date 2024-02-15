import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/new%20&%20hot/widgets/everyone_watching_widget.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String? backdropPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.backdropPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 10, right: 4, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Text(
                    month.toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: colorGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    day,
                    style: GoogleFonts.poppins(
                        fontSize: 47, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoPlayerWidget(url: backdropPath),
                  sizedHeghitT,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width / 2.3,
                            child: Text(
                              movieName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.amaticSc(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Coming on $day $month',
                            style: GoogleFonts.poppins(
                                fontSize: 17, color: colorGrey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const VideoBtnNewAndHotWidget(
                          title: 'Remind Me', icon: CupertinoIcons.bell),
                      sizedWidthT,
                      sizedWidthT,
                      const VideoBtnNewAndHotWidget(
                          title: 'Info', icon: Icons.info_outline),
                      sizedWidthT,
                    ],
                  ),
                  sizedHeghitT,
                  Row(
                    children: [
                      Image.asset(
                          'assets/images/logonetflix-removebg-preview.png',
                          height: 30),
                      sizedWidthT,
                      const Text(
                        'F I L M',
                        style: TextStyle(
                            color: colorWhite, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  MainTitle(title: movieName.toLowerCase()),
                  sizedHeghitT,
                  Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 17,
                        color: colorGrey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
