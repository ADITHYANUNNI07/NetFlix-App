import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/new%20&%20hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/new%20&%20hot/widgets/everyone_watching_widget.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 10, right: 4, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        height: 450,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Text(
                    'Feb'.toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: colorGrey,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '11',
                    style: GoogleFonts.poppins(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VideoPlayerWidget(),
                  sizedHeghitT,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FERDINAND',
                            style: GoogleFonts.amaticSc(
                                fontSize: 60, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Coming on Friday',
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
                  MainTitle(title: 'FERDINAND'.toLowerCase()),
                  sizedHeghitT,
                  const Text(
                    'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence and her relationship Into a tailspin.',
                    style: TextStyle(
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
