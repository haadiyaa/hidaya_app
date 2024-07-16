import 'package:flutter/material.dart';
import 'package:hidhayah/model/playlistmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/videospage/view/playerscreen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlaylistWidgetKids extends StatelessWidget {
  const PlaylistWidgetKids({
    super.key,
    required this.size,
    required this.playListModel,
  });

  final Size size;
  final PlayListModel playListModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.2,
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
                      videoId:
                          playListModel.items![index].contentDetails!.videoId!,
                      nextvideoId: playListModel
                          .items![index + 1].contentDetails!.videoId!,
                    ),
                  ));
            },
            child: Container(
              width: size.width * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(YoutubePlayer.getThumbnail(
                    videoId:
                        playListModel.items![index].contentDetails!.videoId!,
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
  }
}
