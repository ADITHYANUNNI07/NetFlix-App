import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/color/colors.dart';
import 'package:netflix/core/costant.dart';
import 'package:netflix/presentation/new%20&%20hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new%20&%20hot/widgets/everyone_watching_widget.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: colorBlack,
          appBar: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              const Icon(Icons.cast),
              sizedWidthT,
              Image.asset('assets/images/home_icon.png', height: 33),
              sizedWidthT
            ],
            bottom: TabBar(
              labelColor: colorBlack,
              unselectedLabelColor: colorWhite,
              isScrollable: true,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                  color: colorWhite, borderRadius: borderRadius30),
              tabs: const [
                Tab(text: '🍿 Coming Soon'),
                Tab(text: "👀 Everyone's Watching")
              ],
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryoneWatching(),
          ]),
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryOneWatchingWidget(),
    );
  }
}
