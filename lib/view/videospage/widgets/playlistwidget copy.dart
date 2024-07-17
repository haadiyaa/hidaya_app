import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/youtubebloc/youtube_bloc.dart';
import 'package:hidhayah/model/playlistmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/videospage/view/playerscreen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlaylistWidgetKids2 extends StatefulWidget {
  const PlaylistWidgetKids2({
    super.key,
    required this.size,
    required this.playlist,
  });

  final Size size;
  final String playlist;

  @override
  State<PlaylistWidgetKids2> createState() => _PlaylistWidgetKids2State();
}

class _PlaylistWidgetKids2State extends State<PlaylistWidgetKids2> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<YoutubeBloc>(context)
        .add(fetchPlaylistEvent2(playlistId: Constants.umarPlaylist));
  }

  late PlayListModel playListModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YoutubeBloc, YoutubeState>(
      builder: (context, state) {
        if (state is fetchPlaylistState2) {
          playListModel = state.playListModel;
          return SizedBox(
            height: widget.size.height * 0.2,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (context, index) => Constants.width10,
              scrollDirection: Axis.horizontal,
              itemCount: playListModel.items!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlayerScreen(
                            videoId: playListModel
                                .items![index].contentDetails!.videoId!,
                            nextvideoId: playListModel
                                .items![index + 1].contentDetails!.videoId!,
                          ),
                        ));
                  },
                  child: Container(
                    width: widget.size.width * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(YoutubePlayer.getThumbnail(
                          videoId: playListModel
                              .items![index].contentDetails!.videoId!,
                        )),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.greenDark,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
