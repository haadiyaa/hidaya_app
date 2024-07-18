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
import 'package:hidhayah/view/videospage/widgets/playlistwidget.dart';
import 'package:hidhayah/view/videospage/widgets/shimmerlist.dart';
import 'package:hidhayah/view/videospage/widgets/shimmeryoutube.dart';
import 'package:shimmer/shimmer.dart';
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
  @override
  void initState() {
    BlocProvider.of<YoutubeBloc>(context).add(fetchPlaylistEvent());
    super.initState();
  }

  late PlayListModel playListModel1;
  late PlayListModel playListModel2;
  late PlayListModel playListModel3;

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
          child: BlocBuilder<YoutubeBloc, YoutubeState>(
            builder: (context, state) {
              if (state is fetchPlaylistState) {
                playListModel1 = state.playListModel1;
                playListModel2 = state.playListModel2;
                playListModel3 = state.playListModel3;
                return Column(
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
                    PlaylistWidgetKids(
                      size: size,
                      playListModel: playListModel1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Umar (R. A.)',
                        style: TextStyles.gradContainerTextStyle,
                      ),
                    ),
                    PlaylistWidgetKids(
                      size: size,
                      playListModel: playListModel2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'The Jannath',
                        style: TextStyles.gradContainerTextStyle,
                      ),
                    ),
                    PlaylistWidgetKids(
                      size: size,
                      playListModel: playListModel3,
                    ),
                  ],
                );
              }
              return ShimmerYoutube(size: size);
            },
          ),
        ),
      ),
    );
  }
}
