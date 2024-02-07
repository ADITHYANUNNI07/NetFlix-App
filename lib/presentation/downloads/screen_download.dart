import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/appbar_widgets.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});
  final imageList = [
    'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg',
    'https://image.tmdb.org/t/p/w600_and_h900_bestv2/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
    'https://image.tmdb.org/t/p/w600_and_h900_bestv2/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widgetList = [
      const SectionOneWidget(),
      sizedHeghitT,
      SectionTwoWidget(size: size, imageList: imageList),
      const SectionThreeWidget()
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBlack,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget(
              appbarText: 'Downloads',
            )),
        body: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: ListView.separated(
              itemBuilder: (context, index) => widgetList[index],
              itemCount: widgetList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            )),
      ),
    );
  }
}

class SectionOneWidget extends StatelessWidget {
  const SectionOneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Icon(Icons.settings),
          sizedWidthT,
          Text(
            'Smart Downloads',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )
        ],
      ),
    );
  }
}

class SectionThreeWidget extends StatelessWidget {
  const SectionThreeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: colorBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(6)),
            onPressed: () {},
            child: const Text(
              'Set Up',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 11.0, right: 11.0),
            child: MaterialButton(
              color: colorWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(6)),
              onPressed: () {},
              child: const Text(
                'See What You Can Download',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTwoWidget extends StatelessWidget {
  const SectionTwoWidget({
    super.key,
    required this.size,
    required this.imageList,
  });

  final Size size;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Introducing Download for You',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        sizedHeghitT,
        const Text(
          "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: colorGrey),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.38,
                backgroundColor: colorGrey.withOpacity(0.4),
              ),
              DownloadsImageRotateWidget(
                width: 0.4,
                height: 0.58,
                size: size,
                imageUrl: imageList[0],
                rotationAngle: 25,
                margin: const EdgeInsets.only(left: 135, bottom: 30),
              ),
              DownloadsImageRotateWidget(
                height: 0.58,
                width: 0.4,
                size: size,
                imageUrl: imageList[1],
                rotationAngle: -25,
                margin: const EdgeInsets.only(right: 135, bottom: 30),
              ),
              DownloadsImageRotateWidget(
                height: 0.63,
                width: 0.40,
                size: size,
                imageUrl: imageList[2],
                margin: const EdgeInsets.only(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DownloadsImageRotateWidget extends StatelessWidget {
  const DownloadsImageRotateWidget({
    super.key,
    required this.size,
    required this.imageUrl,
    this.rotationAngle = 0,
    required this.margin,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  final Size size;
  final String imageUrl;
  final double rotationAngle;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * width,
        height: size.width * height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
