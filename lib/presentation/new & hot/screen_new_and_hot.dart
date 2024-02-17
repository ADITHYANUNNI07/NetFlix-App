import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot%20&%20new/hot_and_new_bloc.dart';
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
          body: const TabBarView(children: [
            ComingSoonList(key: Key('Coming Soon')),
            EveryOneWatchingList(key: Key("Everyone's Watching"))
          ]),
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      } else if (state.hasError) {
        return const Center(
          child: Text('Error'),
        );
      } else if (state.comingSoonList.isEmpty) {
        return const Center(
          child: Text('List is Empty'),
        );
      } else {
        return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];
              String dateString = movie.releaseDate ?? '';
              List<String> dateParts = dateString.split('-');
              int year = int.parse(dateParts[0]);
              int month = int.parse(dateParts[1]);
              int day = int.parse(dateParts[2]);
              DateTime dateTime = DateTime(year, month, day);
              String monthName = DateFormat.MMM().format(dateTime);
              int extractedDay = dateTime.day;
              if (movie.id == null) {
                return const SizedBox();
              }
              return ComingSoonWidget(
                id: movie.id.toString(),
                month: monthName,
                day: extractedDay.toString(),
                backdropPath: movie.backdropPath,
                movieName: movie.originalTitle ?? '',
                description: movie.overview ?? '',
              );
            });
      }
    });
  }
}

class EveryOneWatchingList extends StatelessWidget {
  const EveryOneWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      } else if (state.hasError) {
        return const Center(
          child: Text('Error'),
        );
      } else if (state.everyOneIsWatchingList.isEmpty) {
        return const Center(
          child: Text('List is Empty'),
        );
      } else {
        return ListView.builder(
            itemCount: state.everyOneIsWatchingList.length,
            itemBuilder: (context, index) {
              final movie = state.everyOneIsWatchingList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              return EveryOneWatchingWidget(
                backdropPath: movie.backdropPath,
                movieName: movie.everyoneMovieTitle ?? '',
                description: movie.overview ?? '',
              );
            });
      }
    });
  }
}
