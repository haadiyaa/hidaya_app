import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/youtubebloc/youtube_bloc.dart';
import 'package:hidhayah/model/playlistmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/constants/yotubeitems.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/videospage/view/playerscreen.dart';
import 'package:hidhayah/view/videospage/widgets/customcurousel.dart';
import 'package:hidhayah/view/videospage/widgets/playlistwidget%20copy%202.dart';
import 'package:hidhayah/view/videospage/widgets/playlistwidget%20copy.dart';
import 'package:hidhayah/view/videospage/widgets/playlistwidget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideospageWrapper extends StatelessWidget {
  const VideospageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YoutubeBloc(),
      child: const VideosPage(),
    );
  }
}

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  late PlayListModel playListModel;
  @override
  void initState() {
    // BlocProvider.of<YoutubeBloc>(context)
    //     .add(fetchPlaylistEvent(playlistId: Constants.kidsPlaylist));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.black,
      appBar: AppBar(
        title: const Text('Watch Videos'),
      ),
      body: SizedBox(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: CustomCurousel(size: size),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Kids',
                        style: TextStyles.gradContainerTextStyle,
                      ),
                    ),
                    PlaylistWidgetKids(size: size, playlist: Constants.kidsPlaylist,),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Text(
                    //     'Umar Series',
                    //     style: TextStyles.gradContainerTextStyle,
                    //   ),
                    // ),
                    // PlaylistWidgetKids2(size: size, playlist: Constants.umarPlaylist,),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Text(
                    //     'The Jannah',
                    //     style: TextStyles.gradContainerTextStyle,
                    //   ),
                    // ),
                    // PlaylistWidgetKids3(size: size, playlist: Constants.yaqeenInstitutelist,),
                  ],
                ),
              ),
            ),
          
    );
  }
}
