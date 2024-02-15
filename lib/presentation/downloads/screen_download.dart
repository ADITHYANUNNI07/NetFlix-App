import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/string.dart';
import 'package:netflix/presentation/widgets/appbar_widgets.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:shimmer/shimmer.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });

    final widgetList = [
      const SectionOneWidget(),
      sizedHeghitT,
      BlocBuilder<DownloadsBloc, DownloadsState>(
        builder: (context, state) {
          return state.isloading
              ? SectionTwoWidget(
                  isloading: true, size: size, imageList: const [])
              : SectionTwoWidget(
                  isloading: false,
                  size: size,
                  imageList: state.downloads
                          ?.map((download) =>
                              '$imageAppendUrl${download.posterPath}')
                          .toList() ??
                      []);
        },
      ),
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
            padding: const EdgeInsets.only(left: 10, right: 10),
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
    required this.isloading,
  });
  final bool isloading;
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
          "We'll download a personalised selection of movies and shows for you, so there's always something watch on your device.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: colorGrey),
        ),
        isloading
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade900.withOpacity(0.9),
                highlightColor: colorGrey.shade800,
                child: ThreeImageContainerWidget(
                    size: size, isloading: isloading, imageList: imageList),
              )
            : ThreeImageContainerWidget(
                size: size, isloading: isloading, imageList: imageList),
      ],
    );
  }
}

class ThreeImageContainerWidget extends StatelessWidget {
  const ThreeImageContainerWidget({
    super.key,
    required this.size,
    required this.isloading,
    required this.imageList,
  });

  final Size size;
  final bool isloading;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: size.width * 0.38,
            backgroundColor: colorGrey.withOpacity(0.4),
          ),
          isloading
              ? DownloadsImageRotateWidget(
                  width: 0.4,
                  height: 0.58,
                  size: size,
                  imageUrl: null,
                  rotationAngle: 20,
                  margin: const EdgeInsets.only(left: 135, bottom: 30),
                )
              : DownloadsImageRotateWidget(
                  width: 0.4,
                  height: 0.58,
                  size: size,
                  imageUrl: imageList.isEmpty ? null : imageList[0],
                  rotationAngle: 20,
                  margin: const EdgeInsets.only(left: 135, bottom: 30),
                ),
          isloading
              ? DownloadsImageRotateWidget(
                  height: 0.58,
                  width: 0.4,
                  size: size,
                  imageUrl: null,
                  rotationAngle: -20,
                  margin: const EdgeInsets.only(right: 135, bottom: 30),
                )
              : DownloadsImageRotateWidget(
                  height: 0.58,
                  width: 0.4,
                  size: size,
                  imageUrl: imageList.isEmpty ? null : imageList[1],
                  rotationAngle: -20,
                  margin: const EdgeInsets.only(right: 135, bottom: 30),
                ),
          isloading
              ? DownloadsImageRotateWidget(
                  height: 0.63,
                  width: 0.40,
                  size: size,
                  imageUrl: null,
                  margin: const EdgeInsets.only(),
                )
              : DownloadsImageRotateWidget(
                  height: 0.63,
                  width: 0.40,
                  size: size,
                  imageUrl: imageList.isEmpty ? null : imageList[2],
                  margin: const EdgeInsets.only(),
                )
        ],
      ),
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
  final String? imageUrl;
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
            color: Colors.grey.shade900.withOpacity(0.9),
            image: imageUrl == null
                ? null
                : DecorationImage(
                    image: NetworkImage(imageUrl!), fit: BoxFit.cover)),
      ),
    );
  }
}
